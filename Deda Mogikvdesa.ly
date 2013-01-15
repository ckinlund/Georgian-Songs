\version "2.16.0"
\header {
	title = "Deda Mogikvdesa"
	poet = "Dartlo, Akhmet’a region of Tusheti"
	composer = "As recorded by Mzatamze"
	arranger = "Transcribed by Patty Cuyler / Colin Kinlund"
	tagline = ##f
}

#(set-default-paper-size "letter" 'portrait)
#(set-global-staff-size 16)

\paper { 
	markup-system-spacing #'padding = #5
	top-margin = 12
%	annotate-spacing = ##t
    system-system-spacing = 
      #'((basic-distance . 16) 
         (minimum-distance . 12) 
         (padding . 1) 
        (stretchability . 60)) 
}

% sbNote = { \once \set fontSize = #-2 }

%{ Lyrics
===============================================================================
%}

MeoriLyrics = \lyricmode
{
	De -- da mo -- gi -- kv -- de -- sa
	
	chem shvi -- lo de -- da -- i
	de -- da ga -- gi -- ta -- v -- da
	shen -- ta -- vi -- s de -- da -- i
	de -- da ga -- gi -- ta -- v -- da
	shen -- ta -- vi -- s de -- da -- i
	
	Shvi -- lo -- si -- d -- gas -- tsi -- re
	gul da -- i -- t na -- ba -- di
	a -- n jokh -- si -- t gas tsi -- re
	bekht mi hu de bu li
	a -- n jokh -- si -- t gas tsi -- re
	bekht mi hu de bu li
	
	Shvi -- lo me shevs ghmen -- tsa
	sha bu na gir ze da
	agh vi -- rebs she -- v -- kh -- ri
	tkven ve lad gu shve ba
	agh vi -- rebs she -- v -- kh -- ri
	tkven ve lad gu shve ba
}

PirveliBaniLyrics = \lyricmode
{
	chem shvi -- lo de -- da -- i
	de -- da ga -- gi -- ta -- v -- da
	shen -- ta -- vi -- s de -- da -- i
	de -- da ga -- gi -- ta -- v -- da
	shen -- ta -- vi -- s de -- da -- i
	
	gul da -- i -- t na -- ba -- di
	a -- n jokh -- si -- t gas tsi -- re
	bekht mi hu de bu li
	a -- n jokh -- si -- t gas tsi -- re
	bekht mi hu de bu li
	
	sha bu na gir ze da
	agh vi -- rebs she -- v -- kh -- ri
	tkven ve lad gu shve ba
	agh vi -- rebs she -- v -- kh -- ri
	tkven ve lad gu shve ba
}

%{ Music
===============================================================================
%}

pirveli = \relative c''
{
	\clef "treble" \key a \minor
	\time 8/4
	\once \override Score.RehearsalMark #'self-alignment-X = #LEFT
	\mark \markup { \small \italic "Sung a 5th lower than written pitch" }
	r1*2
	g4 f g g f f2.
	f4 e e d d8 d d2 r4
	e4 d d8  d d4 d e2.
	f4 e e d d8 d d2.
	e4 d d8 d d4 d e2 r4
	\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
	\mark \markup { \small \bold \italic "Fine" }
	\bar "||"
	r1*2
	g4 f g8 g g4 f f2.
	f8 f e4 e8 e d4 d8 d ~ d2 r4
	e4 d d d d e2.
	f8 f e4 e8 e d4 d8 d ~ d2.
	e4 d d d d e2 r4
	\bar "||"
	r1*2
	g4 f g g f f2.
	f4 e8 e4. d8 d d d ~ d2 r4
	e4 d d d d e2.
	f4 e8 e4. d8 d d d ~ d2.
	e4 d d d d e2.
	\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
	\mark \markup { \small \bold \italic "D.C. al Fine" }
}

meori = \relative c''
{
	\clef "treble" \key a \minor
	a,4 e' d e8 e e4 e2 r4
	e4 d e e d d2.
	d4 c c b b8 b b2 r4
	c4 b b8 b a4 a a2.
	d4 c c b b8 b b2.
	c4 b b8 b a4 a a2 r4
	\bar "||"
	e'4 d d8 d e4 e e2 r4
	e4 d e8 e e4 d d2.
	d8 d c4 c8 c b4 b8 b ~ b2 r4
	c4 b b a a a2.
	d8 d c4 c8 c b4 b8 b ~ b2.
	c4 b b a a a2 r4
	\bar "||"
	e'4 d d e e e2.
	e4 d e e d d2.
	d4 c8 c4. b8 b b b ~ b2 r4
	c4 b b a a a2.
	d4 c8 c4. b8 b b b ~ b2.
	c4 b b a a a2.
	\bar "|."
}

bani = \relative c'
{
	\clef "treble" \key a \minor
	r1*2
	a4 a a a a a2.
	a4 a a g g8 g g2 r4
	g4 g g8 g g4 a a2.
	a4 a a g g8 g g2.
	g4 g g8 g g4 a a2 r4
	\bar "||"
	r1*2
	a4 a a8 a a4 a a2.
	a8 a a4 a8 a g4 g8 g ~ g2 r4
	g4 g g g a a2.
	a8 a a4 a8 a g4 g8 g ~ g2.
	g4 g g g a a2 r4
	\bar "||"
	r1*2
	a4 a a a a a2.
	a4 a8 a4. g8 g g g ~ g2 r4
	g4 g g g a a2.
	a4 a8 a4. g8 g g g ~ g2.
	g4 g g g a a2.
}

\score {
\transpose c a
\new ChoirStaff {
	<<

	\new Voice = "pirveliEkhma"
	{ \pirveli }
	\new Lyrics
	\lyricsto "pirveliEkhma"
	{ \PirveliBaniLyrics }
	
	\new Voice = "meoriEkhma"
	{ \meori }
	\new Lyrics
	\lyricsto "meoriEkhma"
	{ \MeoriLyrics }
		
	\new Voice = "baniEkhma"
	{ \bani }
	\new Lyrics
	\lyricsto "baniEkhma"
	{ \PirveliBaniLyrics }
		
	>>
}
\layout {
	ragged-right = ##f
	indent = 0.00 \cm
	firstpagenumber = no
	papersize = letter
    \context {
		\Staff
%		\remove Bar_engraver
		\remove Time_signature_engraver
%		\remove Clef_engraver
    }
}
}

\markup { \italic
	\fill-line {
	\column {
		\line { }
		\line { Mother would like to die for you, my child.
				She is destroyed, your own mother. }
		\line { Where did you go with your pack and shepherd’s coat, }
		\line { where did you leave the shepherd’s staff that was at your side? }
		\line { I will throw the black bridle over your horse,
				let it out into the forest and field. }
		\line { Mother would like to die for you, my child.
				She is destroyed, your own mother. }
		
	}
}
}