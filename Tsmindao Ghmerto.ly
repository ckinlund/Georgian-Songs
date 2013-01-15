\version "2.16.0"
% \pointAndClickOff
\header {
	title = "Tsmindao Ghmerto"
	poet = ""
	arranger = "Transcribed by Colin Kinlund"
	composer = "As sung by Telavi Ensemble"
	tagline = ##f
}

#(set-default-paper-size "letter" 'portrait)
#(set-global-staff-size 18.5)

global = {
  \key a \major
  \time 4/4
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

EnglishLyrics = \lyricmode
	{
		tsmin -- da -- o ghmer -- to,
		tsmin __ da __ o __
		dzli -- e -- ro __
		tsmin -- da -- o __
		u -- kv -- da wo
		she -- gvi tsqa -- len chven
		
		tsmin -- da __ o __
		u -- pa -- lo
		dzli -- e -- ro
	}

EnglishLyricsPirveliEnd = \lyricmode
	{
		she __ gvi -- tsqa -- len chve __ _ _ _ _ _ _ n.
	}

EnglishLyricsMeoriEnd = \lyricmode
	{
		she __ gvi -- tsqa -- len chve __ _ _ _ _ _ _ _ _ n.
	}

GeorgianLyrics = \lyricmode
	{
		წმინ -- და -- ო ღმერ -- თო,
		წმინ __ და __ ო __
		ძლი -- ე -- რო __
		წმინ -- და __ ო __
		უ -- კვ -- და -- ვო
		შე -- გვი -- წყა -- ლენ ჩვენ
		
		წმინ -- და __ ო __
		უ -- ფა -- ლო
		ძლი -- ე -- რო
		შე __ გვი -- წყა -- ლენ -- ჩვენ. __
	}

%{ Music
===============================================================================
%}

pirveliEkhma = \relative a'
{
	\clef "treble"
	\partial 2.
	cis4 cis cis
	cis2 dis \breathe
	e ( dis)
	dis ( e4 dis8 e)
	cis2 ( b)
	cis dis4. ( e8)
	cis4 ( b cis2)
	\bar "||" \break
	d2 d4 ( cis8 d)
	e4. ( fis8 e4 d8 e)
	cis4 ( d) cis b
	cis2 d4 e8 ( d)
	cis2 b
	cis1
	\bar "||" \break
	e4 ( fis) e ( d8 e)
	cis4 ( d cis b
	cis4. b8 a4 b) \breathe
	\time 3/4
	cis4 cis cis
	\time 4/4
	cis cis dis2 \breathe
	e2 ( dis)
	dis2 e4 dis8 ( e)
	\set melismaBusyProperties = #'()
	fis4. ( e8 e4 dis8 e
	cis2 b
	cis1 \fermata )
	\unset melismaBusyProperties
	\bar "|."
}

meoriEkhma = \relative a'
{
	\set Voice.beatStructure = #'(2 2 2 2)
	\clef "treble"
	\partial 2.
	a4 a a
	b ( gis) a ( b) \breathe
	cis2. ( b8 cis)
	b4. ( ais8 gis a b4)
	b2 ( a4. gis8)
	a4 ( gis8 a) b2
	a4. ( gis8 fis2)
	\bar "||"
	b2 a
	b4 ( cis8 [ d] a [ b] a [ gis])
	a2 a4 gis
	b4 ( a8 gis) a4. gis8
	fis8 ( [ gis] a [ fis]) a ([ b] a [ gis])
	fis1
	\bar "||"
	b8 ( cis d4)
	a8 ( [ b] a [ gis])
	a2. ( gis4
	a8 [ b] a [ gis] fis4 a8 gis) \breathe
	\time 3/4
	a4 a a
	b4 gis a ( b) \breathe
	\time 4/4
	cis2. ( b8 cis)
	b4. ( ais8) gis ( a) b4
	\override Slur #'positions = #'(3 . 1)
	ais8 ( b cis4 b2
	\set melismaBusyProperties = #'()
	b8 [ cis] b [ a] a [ b] a [ gis]
	fis1 \fermata )
	\unset melismaBusyProperties
	\revert Slur #'positions
	\bar "|."
}

baniEkhma = \relative a'
{
	\clef "treble"
	\partial 2.
	fis4 fis fis
	fis2 fis \breathe
	fis4 ( e8 fis gis2)
	gis4 ( fis e2)
	fis4 ( e d e8 cis)
	b4 ( cis) b8 ([ cis] dis [ e])
	fis8 ( d e4 fis2)
	\bar "||"
	g2 fis
	e4. d8 e2
	fis4 ( d) e4 e
	fis4. ( e8) d ( b) cis16 ( d e8)
	fis4 ( d) e2
	fis1
	\bar "||"
	e4 ( d) d ( e)
	fis4 ( d e2
	fis4 b,8 cis d4 e) \breathe
	\time 3/4
	fis4 fis fis
	fis4 fis fis2 \breathe
	\time 4/4
	fis4 ( e8 fis gis2)
	gis4 ( fis) e e
	fis2 ( b,8 [ cis] dis [ e]
	fis2 e
	fis1 \fermata )
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
%     \remove Bar_engraver
%	  \remove Key_engraver
      \remove Time_signature_engraver
%      \remove Clef_engraver
    }
}

\score {
\transpose a c'
\new ChoirStaff {

	<<

	\new Voice = "pirveli"
	{ \global \pirveliEkhma }
	\new Lyrics = "PirveliEnglish"
	\lyricsto "pirveli"
	{ \EnglishLyrics \EnglishLyricsPirveliEnd }
%{
	\new Lyrics = "PirveliGeorgian"
	\lyricsto "pirveli"
	{ \GeorgianLyrics }
%}
	\new Voice = "meori"
	{ \global \meoriEkhma }
	\new Lyrics = "MeoriEnglish"
	\lyricsto "meori"
	{ \EnglishLyrics \EnglishLyricsMeoriEnd }
		
	\new Voice = "bani"
	{ \global \baniEkhma }
	\new Lyrics = "BaniEnglish"
	\lyricsto "pirveli"
	{ \EnglishLyrics \EnglishLyricsPirveliEnd }

	>>
	
	}
}