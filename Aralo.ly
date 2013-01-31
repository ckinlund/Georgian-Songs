\version "2.16.1"
\pointAndClickOff
\header {
	title = "Aralo"
	poet = "Trad. Georgian"
	composer = "Transcribed by Colin Kinlund,"
	arranger = "as sung by Village Harmony, 1998"
	tagline = ##f
}

#(set-default-paper-size "letter" 'portrait)
#(set-global-staff-size 14)


\paper { 
	markup-system-spacing #'padding = #6
%	top-margin = 8
%	annotate-spacing = ##t
    system-system-spacing = 
      #'((basic-distance . 15) 
         (minimum-distance . 12) 
         (padding . 1) 
        (stretchability . 30)) 
}


global = {
	\key c \major
	\time 8/4
}

refrainLyrics = \lyricmode
{
	a -- ra -- lo, o -- ru -- de -- la
	de -- li -- av -- ra -- ni -- na -- ni -- na
}

pirveliLyricsIntro = \lyricmode
{
	A -- ra -- lo, o -- ru -- di -- lo de -- la,
	a -- ba -- de -- li -- a, o -- ru -- de -- la
	{ \refrainLyrics }
}

meoriLyricsIntro = \lyricmode
{
	o -- ru -- di -- lo de -- la,
	a -- ba -- de -- li -- a, o -- ru -- de -- la
	{ \refrainLyrics }
}

baniLyricsIntro = \lyricmode
{
	a -- ba -- de -- li -- a, o -- ru -- de -- la
	{ \refrainLyrics }
}

baniLyricsVerse = \lyricmode
{
	Wo -- hi -- hey -- a
	wo -- hi -- hey -- a -- hey -- a
	{ \refrainLyrics }
}

baniAltOne = \lyricmode
{
	Wa __ wa -- ha -- he -- a
	{ \refrainLyrics }
}

stanzaOneLyrics = \lyricmode
{
	\set stanza = #"1." 
	Che  -- mo mk’vle -- lo che -- mo -- mts’vle -- lo
	che -- mo akh -- los me -- zo -- be -- lo
	{ \refrainLyrics }
}

stanzaTwoLyrics = \lyricmode
{
	\set stanza = #"2." 
	Shen rom tsets -- khli mo -- mi -- k’i -- de,
	mit -- khar ro -- gor da -- va -- ne -- lo
	{ \refrainLyrics }
}

stanzaThreeLyrics = \lyricmode
{
	\set stanza = #"3." 
	Ka -- lo she -- ni tet -- ri k’a -- ba
	ts’qals mi -- hkon -- da mdzi -- na -- re -- so
	{ \refrainLyrics }
}

stanzaFourLyrics = \lyricmode
{
	\set stanza = #"4." 
	Ne -- t’a -- vi ga -- ma -- ge -- bi -- na
	vin ga -- k’o -- tsa mdzi -- na -- re -- so
	{ \refrainLyrics }
}

endLyrics = \lyricmode
{
	hey!
}

pirveliRefrain = \relative c''
{
	d8 d d4 e8. d16 c8 b
	c16 b a8 b8. b16 c8. c16 c4
}

pirveliIntro = \relative c''
{
	\clef "treble"
	c8 d e4 e16 e e e d8 c
	b16 c d e d4 e8. d16 c8 b
	{ \pirveliRefrain }
}

pirveliVerse = \relative c''
{
	\clef "treble"
	\repeat volta 2
	{
		e8 e e e e e e e
		f8 e d c b c d b
		{ \pirveliRefrain }
	}
}

akhlaEnd = \relative c''
{
	\clef "treble"
	\time 4/4
	g1
	\bar "|."
}

meoriVerse = \relative c''
{
	c8 c c c c c c c
	d8 c b a g a b g
	f8 g a( b) c8. b16 a8 g
	a16 g f8 g8. g16 a8. a16 a4
}

meoriRefrain = \relative c''
{
	c8. b16 a8 g a16 g f8 g8. g16 a8. a16 a4
}
	
meoriIntro = \relative c''
{
	\clef "treble"
	r2 c16 c c c b8 a
	g16 a b c b4 c8. b16 a8 g
	f8 g a ( b)
	{ \meoriRefrain }
}

baniIntro = \relative c''
{
	\clef "treble"
	r2 r2
	g16 g g g g4 a8. g16 f8 e
	g8 g g4 a8. g16 f8 e
	f16 e d8 e8. e16 f8. f16 f4 
}

baniRefrain = \relative c'
{
	\clef "treble"
	d8 d d4 d8. d16 e8 c
	d16 d d8 e8. e16 f8. f16 f4
}

baniVerse = \relative c'
{
	\clef "treble"
	c2 ( c8) e g e
	c8 d e f g4. e8
	{ \baniRefrain }
}

baniVerseAltOne = \relative c'
{
	\clef "treble"
	g'1 ~
	g2 g8 a b g
	{ \baniRefrain }
}

\score {
\new ChoirStaff

	<<

	\new Voice = "pirveli"
	{ \global
	\pirveliIntro
%	\once \override Score.RehearsalMark #'break-visibility = #end-of-line-visible
	\once \override Score.RehearsalMark #'self-alignment-X = #LEFT
	\mark \markup { \small "Alternate trio and group on repeats" }
	\pirveliVerse \break
	\pirveliVerse \break
	\pirveliVerse \break
	\pirveliVerse
%	\once \override Score.RehearsalMark #'break-visibility = #end-of-line-visible
	\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
	\mark \markup { \small "After repeat, go to beginning, finish on next measure" }
	\akhlaEnd
	}
	\new Lyrics
	\lyricsto "pirveli"
	{ \pirveliLyricsIntro
	\stanzaOneLyrics
	\stanzaTwoLyrics
	\stanzaThreeLyrics
	\stanzaFourLyrics
	\endLyrics }

	\new Voice = "meori"
	{ \global
	\meoriIntro
	\meoriVerse
	\meoriVerse
	\meoriVerse
	\meoriVerse
	\akhlaEnd }
	\new Lyrics
	\lyricsto "meori"
	{ \meoriLyricsIntro
	\stanzaOneLyrics
	\stanzaTwoLyrics
	\stanzaThreeLyrics
	\stanzaFourLyrics
	\endLyrics }

	\new Voice = "bani"
	{ \global
	\baniIntro
	\baniVerse
	\baniVerseAltOne
	\baniVerse
	\baniVerseAltOne
	\akhlaEnd }
	\new Lyrics
	\lyricsto "bani"
	{ \baniLyricsIntro
	\baniLyricsVerse
	\baniAltOne
	\baniLyricsVerse
	\baniAltOne
	\endLyrics }

	>>

\layout {
	indent = 0 \cm
	firstpagenumber = no
	papersize = letter
%	ragged-last = ##t
    \context {
      \Staff
%     \remove Bar_engraver
      \remove Time_signature_engraver
%      \remove Clef_engraver
    }
}
% \midi { \tempo 4=115 }
}