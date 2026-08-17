<h1> iOS application Architechture </h1>

cocoa touch (application)
            |
Media (core audio, core image)
            |
core services (address book, core data, webKit)
            |
core OS (accelerate, disk configurations)
            |
kernal and device drivers (file system, mach , networking)


<h3>What is Struct ?</h3>
containes
stored vars, computed vars, constant lets, functions, initializers (init), 

<h3>Struct Vs Class ?</h3>

- stuct,enums is value type / class is reference type
- value type stores value itself directly in var/let.
- struct we have let variables so it shows it's immutable nature thats why it's clear and predictable
- class is mutable. even if you use let.
- use @state -> to make stored var to be modified
- use @binding -> to share struct between views
- class has one big advantage : sharing 
and this is it's big disadvantage, because we can't make it immutable so in swift we use classes when we need extreme sharing
- class has identity because of pointers, struct not have we give it explicitely.

<h3>Optionals ?</h3>
<h3>extensions ?</h3>
<h2>CodeBreaker Game</h2>
<p>This project includes a simple CodeBreaker (Mastermind-style) game implemented with SwiftUI.</p>

<h3>Core Types</h3>
<ul>
<li><code>Peg</code>: The color choices a player can pick (red, green, blue, yellow, orange, purple).</li>
<li><code>Code</code>: A sequence of 4 pegs that represents either the hidden master code or a player's guess.</li>
<li><code>Match</code>: Result of comparing a guess to the master code: <em>exact</em> (right color and position), <em>inexact</em> (right color, wrong position), or <em>nomatch</em>.</li>
<li><code>CodeBreaker</code>: The game engine that stores the hidden code, previous attempts, and evaluates guesses.</li>
</ul>

<h3>How Evaluation Works</h3>
<ol>
<li>First pass: mark each position as <code>.exact</code> when the peg matches the same position in the master code.</li>
<li>Second pass: for remaining pegs, mark as <code>.inexact</code> if the peg exists in another position of the master code that hasn't already been matched.</li>
<li>Anything not matched becomes <code>.nomatch</code>.</li>
</ol>

<h3>User Interface</h3>
<ul>
<li><code>UpcomingView</code> shows previous attempts and their results using <code>MatchMarkers</code>.</li>
<li>The current guess can be edited with color pickers (using a <code>Menu</code> per slot) and submitted with a button.</li>
<li>When all four positions are <code>.exact</code>, an alert is shown and you can start a new game.</li>
</ul>

<h3>Extending the Game</h3>
<ul>
<li>Change code length: update <code>Code.length</code> and the UI will adapt.</li>
<li>Change available colors: edit <code>Peg.allCases</code> or the <code>pegChoices</code> passed to <code>CodeBreaker</code>.</li>
<li>Add a max attempts rule: disable the submit button after N attempts and present a loss state with the master code.</li>
<li>Persist games: save <code>attempts</code> and <code>evaluations</code> to disk using <code>Codable</code>.</li>
</ul>

