\version "2.18.0"
\header {
	title = "Perkhuli"
	composer = "Lower Svaneti"
	tagline = ##f
}

#(set-default-paper-size "letter" 'portrait)
#(set-global-staff-size 16)

\paper { 
	markup-system-spacing #'padding = #2
%	top-margin = 3
%	annotate-spacing = ##t
    system-system-spacing = 
      #'((basic-distance . 14) 
         (minimum-distance . 10) 
         (padding . 0) 
        (stretchability . 10)) 
 }


global = {
  \key g \minor
  \time 8/4
}

%{ Lyrics
===============================================================================
%}

PartOne = \lyricmode
{
	Wo -- re -- ra -- i -- u -- do
	wo -- re -- ra -- do,
	wo -- i -- o -- re -- ra,
	wo -- re -- ra,
}

PartTwo = \lyricmode
{
	wo -- re -- rai -- da,
	di -- la -- wo di -- la -- wo di -- la
	wo -- re -- ra da wo __ o,
}

PartThree = \lyricmode
{
	wo -- re -- rai da ru -- mai da,
	wo -- re -- rai da ru -- mai da,
}

PartFour = \lyricmode
{
	woi -- sa re -- ra re -- ra o -- re -- ra,
	wo re -- ra o -- re -- ra,
}

PartFive = \lyricmode
{
	woi -- sa re -- ra o -- re -- ra,
}

PartSix = \lyricmode
{
	woi -- sa o -- ru -- di -- la ra -- mai -- da,
}

EndSyllable = \lyricmode
{
	wo!
}

%{ Music
===============================================================================
%}

pirveliOne = \relative c''
{	
	\repeat volta 2 {
	\set fontSize = #-1.5 d4.^ \markup
	{ \small \italic "Top and bottom voices join Group 1 after repeat" }
	d8 d8. d16 ces8 bes
	c4 c c c-.
	\unset fontSize
	c4.^ \markup { \small \bold "Tutti" } c8 c c bes4
	c4. c8 bes2
	\once \override Score.RehearsalMark #'break-visibility = #end-of-line-visible
	\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
	\mark \markup { \small \italic "Group 1 decides section repititions" }
	}
	
	\break
	
	\repeat volta 3
	{
		\time 4/4
		\set fontSize = #-1.5
		d4. d8 d4 d
		\unset fontSize
		d8 ^\markup { \small \bold "Tutti" } d d d d ees d c
		\time 8/4
		d4. c8 ees4. d8 c8 ( bes a4) bes2
	}
	
	\break
	
	\repeat volta 3
	{
		\once \override Score.RehearsalMark #'self-alignment-X = #LEFT
		\mark \markup { \small \italic "Faster, lively, clap on 8th notes" }
		d8. d16 d8 d d d d4
		d8. d16 c8 d bes a bes4
	}
	
	\break
	
	\repeat volta 3
	{
		\once \override Score.RehearsalMark #'self-alignment-X = #LEFT
		\mark \markup { \small \italic "Speed up slightly with each section" }
		d8 d c8. c16 c8. c16 c c c8
		d4. c16 d d8 c bes4
	}
	
	\break
	
	\time 4/4
	\repeat volta 4
	{
		d8 d d8. d16 d8 c bes4
	}
	
%	\break
	
	\repeat volta 4
	{
		d8 d d16 d d d d8 c bes4
	}
	\time 1/4
	\override NoteHead #'style = #'cross ees4 ^\markup { \small \bold "Both groups" }
	\bar "|."
}

meoriOne = \relative c''
{
	\repeat volta 2 {
	a4. ^\markup { \small \bold "Solo" } b8 c8. b16 a8 bes
	bes4 a8( g) bes4 a4-. 
	g4. g8 g a bes4
	bes4. a8 g2
	}
	
	\repeat volta 3
	{
		\time 4/4
		a4. ^\markup { \small \bold "Solo" } b8 c4 bes
		bes8 bes bes bes bes bes bes a
		\time 8/4
		bes4. a8 bes4. bes8 bes4 ( a) g2
	}
	
	\repeat volta 3
	{
		a8. b16 c8 c c c bes4
		c8. c16 bes8 c bes a g4
	}
	
	\repeat volta 3
	{
		bes8 bes bes8. bes16 bes8. bes16 bes bes bes8
		bes4. bes16 bes bes8 a g4
	}
	
	\repeat volta 4
	{
		bes8 bes bes8. bes16 bes8 a g4
	}
	
	\repeat volta 4
	{
		bes8 bes bes16 bes bes bes bes8 a g4
	}
	\time 1/4
	\override NoteHead #'style = #'cross ees'4
} 

baniOne = \relative c''
{
	\repeat volta 2 {
	\set fontSize = #-1.5
	a4. g8 a8. g16 f8 ees
	f4 f f f-.
	\unset fontSize
	g4. f8 ees ees ees4
	f4. f8 g2
	}
	
	\repeat volta 3
	{
		\time 4/4
		\set fontSize = #-1.5
		a4. a8 a4 g
		\unset fontSize
		f8 f f f f f f f
		g4. f8 ees4. ees8 f2 g
	}
	
	\repeat volta 3
	{
		a8. a16 a8 a a a g4
		f8. f16 f8 f f f g4
	}
	
	\repeat volta 3
	{
		f8 f f8. f16 f8. f16 f f f8
		f4. f16 f f8 f g4
	}
	
	\repeat volta 4
	{
		f8 f f8. f16 f8 f g4
	}
	
	\repeat volta 4
	{
		f8 f f16 f f f f8 f g4
	}
	\time 1/4
	\override NoteHead #'style = #'cross ees'4
}

\score {
	<<
	\new ChoirStaff \with
	{ % \override StaffGrouper #'staffgroup-staff-spacing #'basic-distance = #10
	instrumentName = \markup
	{ \right-column { "Groups 1 & 2"
	\line { "alternate on repeats" } } }
	}
		<<
		\new Staff
		\new Voice = "pirveliOne"
%		{ \set midiInstrument = #"piano" \clef "treble" \global \pirveliOne }
		{ \clef "treble" \global \pirveliOne }
		\new Lyrics
		\lyricsto "pirveliOne"
		{ \PartOne \PartTwo \PartThree \PartFour \PartFive \PartSix \EndSyllable }

		\new Staff
		\new Voice = "meoriOne"
		{ \clef "treble" \global \meoriOne }
		\new Lyrics
		\lyricsto "meoriOne"
		{ \PartOne \PartTwo \PartThree \PartFour \PartFive \PartSix \EndSyllable }

		\new Staff
		\new Voice = "baniOne"
%		{ \set midiInstrument = #"piano" \clef "treble" \global \baniOne }
		{ \clef "treble" \global \baniOne }
		\new Lyrics
		\lyricsto "baniOne"
		{ \PartOne \PartTwo \PartThree \PartFour \PartFive \PartSix \EndSyllable }
		>>
	>>
}

\layout
{
	indent = 3 \cm
%	short-indent = 1 \cm
	firstpagenumber = no
%	papersize = letter
    \context
	{
		\Staff
		\RemoveEmptyStaves
		\override VerticalAxisGroup #'remove-first = ##t
%		\remove Bar_engraver
		\remove Time_signature_engraver
%		\remove Clef_engraver
    }
}

%\midi { \tempo 2 = 72 }