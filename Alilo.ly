\version "2.18.0"
\header {
	title = "Guruli Alilo"
	poet = "Guria"
	arranger = "Transcribed by Colin Kinlund"
	composer = "As sung by Kavkasia / Rustavi Choir"
	tagline = ##f
}

#(set-default-paper-size "letter" 'portrait)
#(set-global-staff-size 17)

global = {
  \key a \minor
  \time 12/8
  \set Timing.beatStructure = #'(3 4 1 2 2)
}


\paper { 
	markup-system-spacing #'padding = #5
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

soloIntro = \lyricmode
	{
		E -- i -- e __
		wo -- o --  o -- wo -- i -- a da,
	}

meoriBaniIntro = \lyricmode
	{
		wo __ i -- a -- da,
	}

verseOne = \lyricmode
	{
		i a -- da ots da khu tsa
		kri __ shob is rer ta
	}

versesIntro = \lyricmode
	{
		E -- i -- e __
		wo __ i -- a -- da,
	}

verseTwo = \lyricmode
	{
		i -- a -- da ish bar kri -- ste,
		ma __ _ _ _ _ tsgo _ ma -- _ ar -- i -- da,
	}

verseThree = \lyricmode
	{
		i a -- da ghmer ma ghmer las,
		ga -- i -- a -- _ _ gi _ te -- _ _ nog -- ta
	}

versesIntroTwo = \lyricmode
	{
		E -- i -- e __
		wo __ do -- i -- a da,
	}
	
verseFour = \lyricmode
	{
		i a -- da sho -- bis ma -- khar,
		do -- i -- o __ be ni -- var -- da
	}

verseFive = \lyricmode
	{
		i a -- da sho -- ba a -- khal,
		tse -- i -- e __ bi tsa -- ri -- da
	}

outro = \lyricmode
	{
		E -- i -- e __
		wo __ i -- a wo -- o -- i -- a
		i -- a a -- li -- lo da!
	}

%{ Music
===============================================================================
%}

pirveliEkhma = \relative a' {
	\clef "treble"
%	\override Staff.StaffSymbol #'line-count = #4
	{
		\partial 1 a4. b8 c8. ( b16 a8 g)
		a8. ( g16 f8) e16 ([ c]) d8 [ e] g [ f] f2
		a4 g16 ( f) e8 f4 e f f-.
		a4. ( f8 a b a) f d ( c4) d8 g2 \break

		\repeat volta 2 { 
		a4. b8 c8. ( b16 a8 g)
		a8. ( g16 f8 [e d e]) g [ f] g2 
		a4 g16 ( f) e8 f4 e f f-.
		\set melismaBusyProperties = #'()
		a4. ( f8 a b a) g16 ( a) d,8 c ( d) d g2 \unset melismaBusyProperties
		\break }

		\repeat volta 2 {
		a4. b8 c8. ( b16 a8 g)
		a8. ([ g16] f8 [ e d]) e [ g f] g2-.  
		a4 g16 ( f) e8 f4 e f f-.
		a4. f8 a ( [g b]) a a ( [g16 a g8]) f f2 \break }

		a4. b8 c8. ( b16 a8 g) \time 4/4 
		a8. ([ g16 f8] e16 [c] d8 [e]) g f
		g4 a b a4-.
		a8 [ f] g [ a] g4 ( f) e1 \bar "|."
	}
}


meoriEkhma = \relative a {
	\clef "treble"
%	\override Staff.StaffSymbol #'line-count = #4
	{
		\partial 1 s1 d8. ( e16 f8 g4.) g8 [ f] f2
		f4 e16 ( d) c8 d4 c d d-.
		f4. ( d8 f g f) e16 ( f) d8 ( c4) d8 c2

		\repeat volta 2 {
		g'4. g8 g4. ( e16 c) d8. ( e16 f8 g4.) g8 [ f] f2
		f4 e16 ( d) c8 d4 c d d4-.
		\set melismaBusyProperties = #'()
		f4. ( d8 f g f) e16 ( f) d8 c ( d) d c2
		\unset melismaBusyProperties }

		\repeat volta 2 {
		g'4. g8 g4. ( e16 c) d8. ( e16 f8 g4) g8 [ g f] f2-.
		f4 e16 ( d) c8 d4 c d d4-.
		f4. f8 f ( [g f]) e16 ( f) d8 ( c4) d8 c2 }

		g'4. g8 g4 ( g8 e16 c)
		\time 4/4 d8. ([ e16 f8] g4.) g8 f
		e4 f g f-. f8 [ d] e f f16 (g f e d4) e1 \bar "|."	
	}
}

baniEkhma = \relative a {
	\clef "treble"
%	\override Staff.StaffSymbol #'line-count = #4
	{
		\partial 1 s1 g4. ( a16 f g8 [a]) a [b] c2
		c4 c16 ( b) a8 b4 a b a-. a2 ~ a4. f8 g ( a4) b8 c2

		\repeat volta 2 {
		d4. d8 d8. ( b16 c8 a16 f) g4. ( a16 f g8 [ a]) a [ b] c2
		c4 c16 ( b) a8 b4 a b g-. a2 ~ a4. f8 g ( a4) b8 c2 }

		\repeat volta 2 {
		g4. g8 g2 g4. ( a16 f g8) a [ a b] c2-.
		c4 c16 ( b) a8 b4 a b g-. a2 ~ a4. f8 g ( a4) b8 c2 }
		
		g4. g8 g2 g4. a16 ( f g8 a) a [ b] c4 c c8 ( a) g4-.
		a8 [ b] c [ a] b ( [ c] c [ d]) e1
	}
}
%}

%{ Layout
===============================================================================
%}

\score {
\transpose a e'
\new ChoirStaff {

<<
	\new Voice = "pirveli"
	{ \global \pirveliEkhma }
	\new Lyrics = "IntroVerseOneTop" \lyricsto "pirveli" {
	\soloIntro \verseOne \versesIntro

		<<
			\verseTwo
			\new Lyrics = "VerseThreeTop" \with { alignBelowContext = "IntroVerseOneTop" } {
			\set associatedVoice = "pirveli"
			\verseThree
		}
	>>
	\versesIntroTwo
	\set associatedVoice = "pirveli"
	<<
			\verseFour
			\new Lyrics = "VerseFiveTop" \with { alignBelowContext = "IntroVerseOneTop" } {
			\set associatedVoice = "pirveli"
			\verseFive
			}
		>>
	\outro
	}


	\new Voice = "meori"
	{ \global \meoriEkhma }
	\new Lyrics = "IntroVerseOneMiddle" \lyricsto "meori" {
	\meoriBaniIntro \verseOne \versesIntro

		<<
			\verseTwo
			\new Lyrics = "VerseThreeMiddle" \with { alignBelowContext = "IntroVerseOneMiddle" } {
			\set associatedVoice = "meori"
			\verseThree
		}
	>>
	\versesIntroTwo
	\set associatedVoice = "meori"
	<<
			\verseFour
			\new Lyrics = "VerseFiveMiddle" \with { alignBelowContext = "IntroVerseOneMiddle" } {
			\set associatedVoice = "meori"
			\verseFive
			}
		>>
	\outro
	}


	\new Voice = "bani"
	{ \global \baniEkhma }
	\new Lyrics = "IntroVerseOneBottom" \lyricsto "bani" {
	\meoriBaniIntro \verseOne \versesIntro

		<<
			\set associatedVoice = "meori"
			\verseTwo
			\new Lyrics = "VerseThreeBottom" \with { alignBelowContext = "IntroVerseOneBottom" } {
			\set associatedVoice = "meori"
			\verseThree
		}
	>>
	\versesIntroTwo
	\set associatedVoice = "meori"
	<<
			\verseFour
			\new Lyrics = "VerseFiveBottom" \with { alignBelowContext = "IntroVerseOneBottom" } {
			\set associatedVoice = "meori"
			\verseFive
			}
		>>
	\outro
	}

>>
}
}

\layout {
	indent = 0 \cm
	firstpagenumber = no
	papersize = letter
    \context {
      \Staff
%     \remove Bar_engraver
%	  \remove Key_engraver
      \remove Time_signature_engraver
%      \remove Clef_engraver
    }
}