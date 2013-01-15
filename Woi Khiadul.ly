\version "2.16.0"
\pointAndClickOff
\header {
	title = "Woi Khiadul"
	poet = "Upper Svaneti"
%	arranger = "Transcribed by Colin Kinlund"
	composer = "As sung by Ensemble Riho"
	tagline = ##f
}

#(set-default-paper-size "letter" 'portrait)
#(set-global-staff-size 18.5)

global = {
  \key a \minor
}


\paper { 
	markup-system-spacing #'padding = #2
%	top-margin = 12
%	annotate-spacing = ##t
    system-system-spacing = 
      #'((basic-distance . 17) 
         (minimum-distance . 12) 
         (padding . 1) 
%        (stretchability . 30)) 
 }


%{ Lyrics
===============================================================================
%}

IntroLyrics = \lyricmode
{
	Woi Khi -- a -- dul, o,
}

IntroLyricsBlank = \lyricmode
{
	\skip 4 \skip 4 \skip 4 \skip 4 \skip 4
}

AkhlaLyricsOne = \lyricmode
{
	mush -- gwa -- ra lei -- da,
	woi khi -- a -- dul,
	wo -- i mush -- gwa -- ra -- lebs,
	ska -- u -- gwi -- kho -- ni shvi -- do -- bdi.
	Wo -- re -- rai -- da,
	wo -- i -- wo -- de -- li -- a.
	Wo -- re -- rai -- da,
	wo -- i -- wo -- de -- li -- a.
}

AkhlaLyricsTwo = \lyricmode
{
	mas -- ba -- ra -- lei da
	woi khi -- a -- dul, wo -- i mas -- ba -- ra -- le,
	sga -- u gwe -- kho -- lid shvi -- do -- bdi.
	Wo -- re -- rai -- da,
	wo -- i -- wo -- de -- li -- a.
	Wo -- re -- rai -- da,
	wo -- i -- wo -- de -- li -- a.
}

%{ Music
===============================================================================
%}

pirveliEkhma = \relative c''
{
	\clef "treble"
	\time 19/8
	cis2. d8 e cis2 d8 ( b2 a4)
	\time 8/4
	e'2 e e4 ( d) c c
	\time 12/4
	d4. d8 b4 c
	d4. e8 d4 c b2 a
	e'4. f8 d4 c
	d4. ( e8 d4) c8 ( a) b2 a
	\repeat volta 2
	{
		e'4. f8 d4 c
		d4. e8 d4 c8 ( a) b2 a
	}
}

meoriEkhma = \relative c''
{
	\clef "treble"
	s8*19
	a2 d c4 ( b) b a
	b4. b8 g4 a
	b4. c8 b4 b8 ( a) g2 a
	c4. c8 b4 a
	b4. ( c8 b4) b8 ( a) g2 a
	\repeat volta 2
	{
		c4. c8 b4 a
		b4. c8 b4 b8 ( a) g2 a
	}
}

baniEkhma = \relative c''
{
	\clef "treble"
	s8*19
	a2 a a4 ~ a e f
	g4. g8 e4 f
	g4. g8 e4 f g2 a
	e4. e8 e4 e
	g2 ( e4) e8 ( f) g2 a
	\repeat volta 2
	{
		e4. e8 e4 e
		g4. g8 e4 e8 ( f) g2 a
	}
}

%{ Score
===============================================================================
%}

\layout {
	indent = 0 \cm
	firstpagenumber = no
	papersize = letter
    \context {
      \Staff
%	\remove Bar_engraver
%	\remove Key_engraver
	\remove Time_signature_engraver
%	\remove Clef_engraver
	}
}

\score {
%\transpose a c'
\new ChoirStaff {

	<<

	\new Voice = "pirveli"
	{ \global \pirveliEkhma }
	\new Lyrics
	\lyricsto "pirveli"
	{ \IntroLyrics \AkhlaLyricsOne }
	\new Lyrics
	\lyricsto "pirveli"
	{ \IntroLyricsBlank \AkhlaLyricsTwo }

	\new Voice = "meori"
	{ \global \meoriEkhma }
	\new Lyrics
	\lyricsto "meori"
	{ \AkhlaLyricsOne }
	\new Lyrics
	\lyricsto "meori"
	{ \AkhlaLyricsTwo }

	\new Voice = "bani"
	{ \global \baniEkhma }
	\new Lyrics
	\lyricsto "bani"
	{ \AkhlaLyricsOne }
	\new Lyrics
	\lyricsto "bani"
	{ \AkhlaLyricsTwo }
	
	>>
	
	}
}
