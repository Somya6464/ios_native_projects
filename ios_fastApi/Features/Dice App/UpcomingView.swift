import SwiftUI

// Use the shared Match enum from MatchMarkers.swift
// Define uniquely named, file-scoped models to avoid conflicts with any project-wide models.
private enum CBPeg: CaseIterable, Hashable {
    case red, green, blue, yellow, orange, purple

    var color: Color {
        switch self {
        case .red: return .red
        case .green: return .green
        case .blue: return .blue
        case .yellow: return .yellow
        case .orange: return .orange
        case .purple: return .purple
        }
    }

    var label: String {
        switch self {
        case .red: return "Red"
        case .green: return "Green"
        case .blue: return "Blue"
        case .yellow: return "Yellow"
        case .orange: return "Orange"
        case .purple: return "Purple"
        }
    }
}

private struct CBCode: Equatable, Hashable {
    static let length = 4
    var pegs: [CBPeg]

    static func random(from choices: [CBPeg] = Array(CBPeg.allCases.prefix(6))) -> CBCode {
        var arr: [CBPeg] = []
        for _ in 0..<length { arr.append(choices.randomElement()!) }
        return CBCode(pegs: arr)
    }
}

private struct CBEngine {
    var masterCode: CBCode
    var attempts: [CBCode] = []
    var evaluations: [[Match]] = []
    var pegChoices: [CBPeg]

    init(masterCode: CBCode = .random(), pegChoices: [CBPeg] = Array(CBPeg.allCases.prefix(6))) {
        self.masterCode = masterCode
        self.pegChoices = pegChoices
    }

    mutating func evaluate(_ guess: CBCode) -> [Match] {
        attempts.append(guess)
        let matches = Self.evaluate(guess: guess, against: masterCode)
        evaluations.append(matches)
        return matches
    }

    static func evaluate(guess: CBCode, against master: CBCode) -> [Match] {
        let n = CBCode.length
        var result = Array(repeating: Match.nomatch, count: n)
        var usedMaster = Array(repeating: false, count: n)
        var usedGuess = Array(repeating: false, count: n)

        for i in 0..<n {
            if guess.pegs[i] == master.pegs[i] {
                result[i] = .exact
                usedMaster[i] = true
                usedGuess[i] = true
            }
        }
        for i in 0..<n where !usedGuess[i] {
            for j in 0..<n where !usedMaster[j] {
                if guess.pegs[i] == master.pegs[j] {
                    result[i] = .inexact
                    usedMaster[j] = true
                    break
                }
            }
        }
        return result
    }
}

// MARK: - View
struct UpcomingView: View {
    @State private var game = CBEngine()
    @State private var currentGuess: CBCode = CBCode(pegs: Array(repeating: .red, count: CBCode.length))
    @State private var showWin = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(Array(game.attempts.enumerated()), id: \.offset) { idx, attempt in
                            HStack(spacing: 12) {
                                codeRow(for: attempt)
                                if idx < game.evaluations.count {
                                    MatchMarkers(matches: game.evaluations[idx])
                                        .frame(width: 44)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }

                Divider()
                Text("Make a guess").font(.headline)
                codeEditor
                Button("Submit Guess") {
                    let matches = game.evaluate(currentGuess)
                    if matches.allSatisfy({ $0 == .exact }) {
                        showWin = true
                    } else {
                        currentGuess = CBCode(pegs: Array(repeating: game.pegChoices.first ?? .red, count: CBCode.length))
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding(.bottom)
            }
            .navigationTitle("CodeBreaker")
            .alert("You cracked it!", isPresented: $showWin) {
                Button("New Game") { newGame() }
            } message: {
                Text("Great job. Tap New Game to play again.")
            }
        }
        .onAppear {
            currentGuess = CBCode(pegs: Array(repeating: game.pegChoices.first ?? .red, count: CBCode.length))
        }
    }

    private func newGame() {
        game = CBEngine()
        currentGuess = CBCode(pegs: Array(repeating: game.pegChoices.first ?? .red, count: CBCode.length))
        showWin = false
    }

    @ViewBuilder private var codeEditor: some View {
        HStack(spacing: 12) {
            ForEach(0..<CBCode.length, id: \.self) { idx in
                Menu {
                    ForEach(game.pegChoices, id: \.self) { peg in
                        Button(action: { currentGuess.pegs[idx] = peg }) {
                            Label(peg.label, systemImage: "circle.fill")
                                .foregroundStyle(peg.color)
                        }
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .aspectRatio(1, contentMode: .fit)
                        .foregroundStyle(currentGuess.pegs[idx].color)
                }
            }
        }
        .padding(.horizontal)
    }

    private func codeRow(for code: CBCode) -> some View {
        HStack(spacing: 8) {
            ForEach(code.pegs.indices, id: \.self) { i in
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(code.pegs[i].color)
            }
        }
    }
}

#Preview { UpcomingView() }
