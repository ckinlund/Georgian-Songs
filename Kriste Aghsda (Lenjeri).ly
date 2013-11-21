\version "2.16.1"
\header {
	title = "Kriste Aghsda"
	poet = "Lenjer (Svaneti)"
	composer = "Arranged by Islam Pilpani"
	arranger = "Transcribed by Sarah Burghardt and Colin Kinlund"
	tagline = ##f
}

#(set-default-paper-size "letter" 'portrait)
#(set-global-staff-size 18)

%{ Lyrics
==============================================================================
%}

MeoriIntro = \lyricmode
{
	Kri -- st’e aghs -- dga
	mk’ -- re -- tit _ __
}

AkhlaVerse = \lyricmode
{
	sik’v -- di -- li -- ta
	sik’v -- di -- li -- sa yi,
	
	dam -- trugun -- ve -- li da
	sa -- pla -- ve -- bis
	shi -- na -- ta
	
	tskho -- vre -- bis
	mim -- ni -- ch’e -- be -- li
}

%{ Music
==============================================================================
%}

pirveli = \relative c''
{
	\clef "treble"
	\time 7/4
	R4*7
	\time 12/8
	e8 [ e e e ] f [ f f ] e4. \glissando c4
	\time 17/8
	d8 e4 f8. e16 d8 c d4 f8 e e f ( e) d4. \fermata
	\time 7/4
	e2 e8. e16 f8 e d c d2
	\bar ":|"
	\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
	\mark \markup { \small "Repeat three times" }
}

meori = \relative c''
{
	\clef "treble"
	\time 7/4
	\autoBeamOff
	c2 c8 c c c d b4. \glissando a4
	\autoBeamOn
	\time 12/8
	a8 [ a a a ] d [ d d ] c4. \glissando a4
	\time 17/8
	b8 c4 d8. c16 b8 a b ( c) d d b c4 d4. \fermata
	\time 7/4
	a2 d8. c16 c8 c16 ( b) c ( b) a8 g2
}

bani = \relative c''
{
	\clef "treble"
	\time 7/4
	R4*7
	\time 12/8
	a8 [ a a a ] a [ a a ] a4. \glissando f4
	\time 17/8
	g8 g4 g8. g16 g8 g g4 g8 g g g4 g4. \fermata
	\time 7/4
	a2 a8. a16 f8 f f f g2
} 

%{ Layout
==============================================================================
%}

\score {
\new ChoirStaff {
% \key a \minor

	<<
	\new Voice = "pirveliEkhma"
	{ \pirveli }
	\new Lyrics
	\lyricsto "pirveliEkhma"
	{ \AkhlaVerse }
	
	\new Voice = "meoriEkhma"
	{ \meori }
	\new Lyrics
	\lyricsto "meoriEkhma"
	{ \MeoriIntro \AkhlaVerse }
	
	\new Voice = "baniEkhma"
	{ \bani }
	\new Lyrics
	\lyricsto "baniEkhma"
	{ \AkhlaVerse }
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
