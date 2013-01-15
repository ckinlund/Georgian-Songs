\version "2.16.0"
\header {
	title = "Mtiuluri"
%	poet = ""
	composer = "As sung by Trio Kavkasia"
	arranger = "Transcribed by Patty Cuyler / Colin Kinlund"
	tagline = ##f
}

#(set-default-paper-size "letter" 'portrait)
#(set-global-staff-size 16)

\paper {
	markup-system-spacing #'padding = #5
	top-margin = 6
%	annotate-spacing = ##t
    system-system-spacing = 
      #'((basic-distance . 14) 
         (minimum-distance . 10) 
         (padding . 1) 
        (stretchability . 60)) 
}

% sbNote = { \once \set fontSize = #-2 }

%{ Lyrics
===============================================================================
%}

SoloStanzaOne = \lyricmode
{
%	\set stanza = #"1. "
	Zo -- gi -- _ i -- ge -- _ ti _ _ _
	ka -- li _ a -- _ _ _ da _ _
	ma grad -- e mai -- khe -- vevs
	ta -- vsa -- o,
	k’okh -- t’ad -- e ga -- i -- vlis _ _ _
	khal -- khshi -- a __ _ _ _ _
	a -- i ghe -- ri -- ebs _ _
	tav -- sa -- o
}

SoloStanzaTwo = \lyricmode
{
%	\set stanza = #"2. "
	Ti -- ton -- e rom -- kma -- _ ri _ _ _
	mo -- u -- _ va -- _ _ _ da _ _
	dza -- li -- _ ta -- qva -- rebs
	tav -- sa -- o,
	me she -- _ ni gam -- k’vir _ _ _
	ve -- bi -- a __ _ _ _ _
	ro -- gor ma -- ne -- beb _ _
	tav -- sa -- o
}

SoloStanzaThree = \lyricmode
{
%	\set stanza = #"3. "
	Verts tvi -- _ ton ma -- _ gi _ _ _
	gor -- de -- _ bi -- _ _ _ da _ _
	she -- mo -- _ ge -- khve -- vi
	tsel -- sa -- o,
	am che -- _ me mom -- k’le _ _ _
	chk’u -- i -- ta __ _ _ _ _
	gha -- me sjo -- bi -- a _ _
	dghe -- sa -- o
}

ChorusStanzaOne = \lyricmode
{
	K’okh -- t’ad -- e ga -- i -- vlis
	khal -- khshi -- a
	a -- i ghe -- ri -- ebs,
}

ChorusStanzaTwo = \lyricmode
{
	Me she -- _ ni gam -- k’vir
	ve -- bi -- a
	ro -- gor ma -- ne -- beb,
}

ChorusStanzaThree = \lyricmode
{
	Am che -- _ me mom -- k’le
	chk’u -- i -- ta
	gha -- me sjo -- bi -- a,
}

Refrain = \lyricmode
{
	Ram da -- ri da -- ri da -- ri dai,
	ram da -- ri da -- ri da -- ri dai,
	ram da -- ri da -- ri da -- ri dai,
	rm,
	da -- ri dm!
}


%{ Music
===============================================================================
%}

panduri-tuning = \stringTuning < c' d' a' >

panduri = \relative c'
{
	\clef "treble" \key a \minor
	\time 6/4
	e8 a e a e a e a e a e a
	e8 a e a e a e a e a c, f
	c8 f c f d g e a e a e a
	e a fis a fis a fis a fis a e a
	c,8 f c f d g e a e a e a 
	fis8 a fis a fis d c f c f d g
	\repeat volta 2
	{
	e8 a e a e a fis a fis a e4
	d8 g d g d4 < c d g >2.
	}
	< d e a >4
}

solo = \relative c''
{
	\clef "treble" \key a \minor
	\time 6/4
	r1.
	\set melismaBusyProperties = #'()
	e8 e16 ( d) e8 e16 ( d) c ( d c b)
	c8 c16 ( b) a ( b a g) f ( e f8)
	c'8 c16 b c8. b16 b4
	a8. a16 a4 r4
	e'8 e16 d fis8 fis e16 ( fis e d)
	d8 d d4 ( e16 d c b)
	c8 b c b b16 ( c b8)
	\unset melismaBusyProperties
	a8. a16 a4 s4
	r1.
}

pirveli = \relative c''
{
	\clef "treble" \key a \minor
	r1.
	r1.
	r1.
	r1.
	r2.
	\set melismaBusyProperties = #'()
	e8 e16 e e8 e e4
	\unset melismaBusyProperties
	fis8 fis fis4. ( d8)
	f8 f f f d r8
%	\once \override Score.RehearsalMark #'break-visibility = #end-of-line-visible
	\once \override Score.RehearsalMark #'self-alignment-X = #LEFT
	\mark \markup { \small \italic "softer second time" }
	\repeat volta 2
	{
		e8 e16 e e e e e g4
		fis8 fis16 fis fis fis fis fis e4
		d8 d16 d d d d d c4 d2.
	}
	\time 1/4
	\once \override Score.RehearsalMark #'self-alignment-X = #LEFT
	\mark \markup { \small \italic "Coda" }
	e16 e e8
	\bar "|."
}

meori = \relative c''
{
	\clef "treble" \key a \minor
	r1.
	r1.
	r1.
	r1.
	r2.
	\set melismaBusyProperties = #'()
	c8 c16 c c8 c c4
	\unset melismaBusyProperties
	d8 d d4. ( bes8)
	c8 c c c b r8
	\repeat volta 2
	{
	c8 c16 c c c c c e4
	d8 d16 d d d d d c4
	b8 b16 b b b b b a4 c2.
	}
	d16 d d8
}

bani = \relative c''
{
	\clef "treble" \key a \minor
	r1.
	r1.
	r1.
	r1.
	r2.
	\set melismaBusyProperties = #'()
	a8 a16 a a8 a a4
	\unset melismaBusyProperties
	a8 a a4. ( g8)
	f8 f f f g r8
	\repeat volta 2
	{
	a8 a16 a a a a a a4
	d,8 d16 d d d d d e4
	g8 g16 g g g g g f4 g2.
	}
	a16 a a8
}

\score {
<<
	\new ChoirStaff <<
	\new Staff

	\with
	{
		instrumentName = #"Solo"
%		shortInstrumentName = #"Sl."
    }

	\new Voice = "SoloVoice" 
	{ \solo }
	\new Lyrics
	\lyricsto "SoloVoice"
	{ \SoloStanzaOne }
	\new Lyrics
	\lyricsto "SoloVoice"
	{ \SoloStanzaTwo }
	\new Lyrics
	\lyricsto "SoloVoice"
	{ \SoloStanzaThree }
	
	\new Staff
%{
	\with
	{
	 instrumentName = #"Pirveli"
	 shortInstrumentName = #"P."
	}
%}
	\new Voice = "PirveliEkhma" 
	{ \pirveli }
	\new Lyrics
	\lyricsto "PirveliEkhma"
	{ \ChorusStanzaOne \Refrain }
	\new Lyrics
	\lyricsto "PirveliEkhma"
	{ \ChorusStanzaTwo }
	\new Lyrics
	\lyricsto "PirveliEkhma"
	{ \ChorusStanzaThree }

	\new Staff
%{
	\with
	{
	 instrumentName = #"Meori"
	 shortInstrumentName = #"M."
	}
%}
	\new Voice = "MeoriEkhma"
	{ \meori }
	\new Lyrics
	\lyricsto "MeoriEkhma"
	{ \ChorusStanzaOne \Refrain }
	\new Lyrics
	\lyricsto "MeoriEkhma"
	{ \ChorusStanzaTwo }
	\new Lyrics
	\lyricsto "MeoriEkhma"
	{ \ChorusStanzaThree }
	
	\new Staff
%{
	\with
	{
		instrumentName = #"Bani"
		shortInstrumentName = #"B."
    }
%}
	\new Voice = "BaniEkhma"
	{ \bani }
	\new Lyrics
	\lyricsto "BaniEkhma"
	{ \ChorusStanzaOne \Refrain }
	\new Lyrics
	\lyricsto "BaniEkhma"
	{ \ChorusStanzaTwo }
	\new Lyrics
	\lyricsto "BaniEkhma"
	{ \ChorusStanzaThree }

	>>
	
%	\new TabStaff
	\new Staff
	\with
	{
%		stringTunings = #panduri-tuning
		instrumentName = #"Panduri"
%		shortInstrumentName = #"Pnd."
		fontSize = #-1.5
		\override StaffSymbol #'staff-space = #(magstep -1)
	}

	{ \panduri }
>>	
}

\layout {
	ragged-right = ##f
%	indent = 0.00 \cm
	firstpagenumber = no
	papersize = letter
    \context {
		\Staff
		\RemoveEmptyStaves
		\override VerticalAxisGroup #'remove-first = ##t
		\remove Time_signature_engraver
    }
}
