\version "2.18.0"
\header {
	title = "Ak’a sire kisho"
	composer = "As taught by Baia Zhuzhunashvili"
	poet = "Samegrelo"
	arranger = "Transcribed by Vera Broekhuysen & Colin Kinlund"
	tagline = ##f
}

#(set-default-paper-size "letter" 'portrait)
#(set-global-staff-size 16)
\paper { 
%{
	#(define fonts
	(make-pango-font-tree	"Athelas"
							"Avenir Next"
							"Source Code Pro"
							(/ staff-height pt 20)
							)
	)
%}
top-margin = 0.75\in
bottom-margin = 1\in
left-margin = 0.75\in
right-margin = 0.75\in

	markup-system-spacing #'padding = #6
	top-margin = 12
%	annotate-spacing = ##t
    system-system-spacing = 
      #'((basic-distance . 12) 
         (minimum-distance . 10) 
         (padding . 1) 
        (stretchability . 60)) 
 }

global = {
  \key a \minor
  \time 6/4
}

stanzaOne = \lyricmode
{ \set stanza = #"1."
	A -- k’a si -- re ki -- sho,
	al -- ma si -- re ki -- sho na
	Kor -- de -- le -- khi -- ni,
	va -- ma dzi -- re ki -- sho na
}

stanzaTwo = \lyricmode
{ \set stanza = #"2." 
	I -- ro gu -- u -- ri -- sha,
	a -- la mi -- re ki -- sho na
	gu -- ma -- shi -- ne -- ni,
	man -- ga -- ri -- ne -- ni -- sho na
}

refrain = \lyricmode
{
	De -- dou, de -- dou,
	mev -- di -- na -- u,
	chki -- mi -- tso -- da,
	de -- dou, de -- dou
	mev -- di -- na -- u,
	chki -- mi -- tso -- da.
}

pirveli = \relative a'' { \clef "treble"
	{
	e4 e e e d c
	e4 e e d c b
	\time 4/4
	a2. r4
	a4 b c d
	e2. ( d4) \breathe
	\time 6/4
	c4 c d c b a
	\time 4/4
	g2. r4
	\time 6/4
	e'2. f8( e) d4 c
	e4 e d2 e \fermata
	c4. d8 b2 a
	e'2. f8( e) d4 c
	e4 e d2 e \fermata
	\time 8/4
	c4. d8 b2 a1 \bar "|."
	}
}

meori = \relative a' { \clef "treble"
	{
	c4 c c c b a
	c c c b a g
	\time 4/4
	a2. r4
	a4 g a a
	b1 \breathe
	\time 6/4
	a4 a b a g f
	\time 4/4
	g2. r4
	\time 6/4
	c2. c4 b a
	c c b2 b \fermata
	a4. a8 g2 a
	c2. c4 b a
	c c b2 b \fermata
	\time 8/4 a4. a8 g2 a1
	}
} 

bani = \relative a' { \clef "treble"
	{
	g4 g g g g e
	g g g e f g \time 4/4 a2. r4
	a4 g f f e1 \breathe
	\time 6/4
	f4 f f d e f \time 4/4 g2. r4
	\time 6/4
	g2. g4 g e g g g2 e \fermata
	f4. f8 g2 a
	c,2. d4 e f g g g2 e \fermata
	\time 8/4 f4. f8 g2 a1
	}
}

\score {
\new ChoirStaff \with { \override StaffGrouper #'staffgroup-staff-spacing #'basic-distance = #10 }

	<< 
	\new Voice = "pirveli"
	{ \global \pirveli }
	\new Lyrics
	\lyricsto "pirveli"
	{ \stanzaOne \refrain }

	\new Voice = "meori"
	{ \global \meori }
	\new Lyrics
	\lyricsto "meori"
	{ \stanzaTwo \refrain }
	
	\new Voice = "bani"
	{ \global \bani }
	>>

\layout {
	indent = 0 \cm
	firstpagenumber = no
	papersize = letter
    \context {
      \Staff
      \remove Time_signature_engraver
    }
}
}

\markup {
	\fill-line {
	\column{
	\line{ Children in Samegrelo (Western Georgia) were frequently kidnapped for ransom, }
	\line{ due in part to the high wealth of the region and the noble status of many families. }
	\line{ This song laments the loss of a kidnapped child, sung almost as a lullabye to that child. }
	\line{ “Chkimi tsoda” is “chemi tsoli” in Georgian — “my grief.” }
	}
}
}
