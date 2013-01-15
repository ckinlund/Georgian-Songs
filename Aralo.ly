\version "2.14.2"
\header {
	title = "Aralo"
	composer = "Trad. Georgian"
	tagline = ##f
}

#(set-default-paper-size "letter" 'landscape)
#(set-global-staff-size 22.45)
\paper { 
	markup-system-spacing #'padding = #6
	top-margin = 15
%	annotate-spacing = ##t
    system-system-spacing = 
      #'((basic-distance . 12) 
         (minimum-distance . 10) 
         (padding . 1) 
        (stretchability . 60)) 
 }

refrainLyrics = \lyricmode
{ a -- ra -- lo, o -- ru -- de -- la de -- li -- av -- ra -- ni -- na -- ni -- na }

pirveliLyricsIntro = \lyricmode
{ A -- ra -- lo, o -- ru -- di -- lo de -- la, a -- ba -- de -- li -- a, o -- ru -- de -- la { \refrainLyrics } }

baniLyricsIntro = \lyricmode
{ a -- ba -- de -- li -- a, o -- ru -- de -- la { \refrainLyrics } }

baniLyricsVerse = \lyricmode
{ Wo -- hi -- hey -- a wo -- hi -- hey -- a -- hey -- a { \refrainLyrics } }

stanzaOneLyrics = \lyricmode
{ \set stanza = #"1." 
Che  -- mom -- ts’ve -- lo che -- mom -- k’vle -- lo che -- mo akh -- los me -- zo -- be -- lo { \refrainLyrics } }

stanzaTwoLyrics = \lyricmode
{ \set stanza = #"2." 
Shen rom tsets -- khli mo -- mi -- khi -- de, mit -- kha -- ro -- na ga -- na -- he -- na { \refrainLyrics } }

pirveliRefrain = \relative c'' {
	d8 d d4 e8. d16 c8 b c16 b a8 b8. b16 c8. c16 c4 }

pirveliIntro = \relative c'' {
	\clef "treble" \time 2/4 %\override Staff.StaffSymbol #'line-count = #4
	c8 d e4 e16 e e e d8 c b16 c d e d4 e8. d16 c8 b { \pirveliRefrain }
	}
pirveliVerse = \relative c'' {
	\clef "treble" \time 2/4
	\bar "|:" e8 e e e e e e e f e d c b c d b { \pirveliRefrain } \bar ":|"
	}

meoriVerse = \relative c'' {
	c8 c c c c c c c d c b a g a b g f g a( b) c8. b16 a8 g a16 g f8 g8. g16 a8. a16 a4  \bar ":|"
	}

meoriRefrain = \relative c'' {
	c8. b16 a8 g a16 g f8 g8. g16 a8. a16 a4 }
	
meoriIntro = \relative c'' {
	\clef "treble"
	r2 r2 g16 a b c b4 c8. b16 a8 g b b b4 { \meoriRefrain }
	}

baniIntro = \relative c'' {
	\clef "treble"
	r2 r2 g16 g g g g4 a8. g16 f8 e g g g4 a8. g16 f8 e f16 e d8 e8. e16 f8. f16 f4 
	}

baniVerse = \relative c' {
	\clef "treble"
	c2 ( c8) e g e c d e f g4. e8 d d d4 d8. d16 e8 c d16 d d8 e8. e16 f8. f16 f4 
	}

\score {
\new ChoirStaff \with { \override StaffGrouper #'staffgroup-staff-spacing #'basic-distance = #10 }

	<< 
	\new Voice = "pirveliIntro"
	{ \pirveliIntro }
	\new Lyrics
	\lyricsto "pirveliIntro"
	{ \pirveliLyricsIntro }
	
	\new Voice = "meoriIntro"
	{ \meoriIntro }
	\new Lyrics
	\lyricsto "meoriIntro"
	{ \baniLyricsIntro }

	\new Voice = "baniIntro"
	{ \baniIntro }
	\new Lyrics
	\lyricsto "baniIntro"
	{ \baniLyricsIntro }
	>>
\layout {
	indent = 0 \cm
	firstpagenumber = no
	papersize = letter
    \context {
      \Staff
%     \remove Bar_engraver
%      \remove Time_signature_engraver
%      \remove Clef_engraver
    }
}
}
\score {
\new ChoirStaff \with { \override StaffGrouper #'staffgroup-staff-spacing #'basic-distance = #10 }

	<<
	\new Voice = "pirveliVerse"
	{ \pirveliVerse }
	\new Lyrics
	\lyricsto "pirveliVerse"
	{ \stanzaOneLyrics }
	\new Lyrics
	\lyricsto "pirveliVerse"
	{ \stanzaTwoLyrics }

	\new Voice = "meoriVerse"
	{ \meoriVerse }
%{	\new Lyrics
	\lyricsto "meori"
	\stanzaTwo
%}
	\new Voice = "baniVerse"
	{ \baniVerse }
	\new Lyrics
	\lyricsto "baniVerse"
	{ \baniLyricsVerse }	
	>>
\layout {
	indent = 0 \cm
	firstpagenumber = no
	papersize = letter
    \context {
      \Staff
%     \remove Bar_engraver
%      \remove Time_signature_engraver
%      \remove Clef_engraver
    }
}
}