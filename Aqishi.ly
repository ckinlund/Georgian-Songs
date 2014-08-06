\version "2.18.0"
\language "english"
\header {
	title = "Aqishi"
	poet = "Abkhazia"
	arranger = "Transcribed by Colin Kinlund"
	composer = "As recorded by Darbazi"
	tagline = ##f
}
\pointAndClickOff
#(set-default-paper-size "letter" 'portrait)
#(set-global-staff-size 17)

\paper { 
	
top-margin = 0.75\in
bottom-margin = 1\in
left-margin = 0.75\in
right-margin = 0.75\in

	markup-system-spacing #'padding = #5
%	top-margin = 12
%	annotate-spacing = ##t
    system-system-spacing = 
      #'((basic-distance . 17) 
         (minimum-distance . 12) 
         (padding . 1) 
         (stretchability . 30)) 
 }

pirveliLyrics = \lyricmode
{
O, o -- a -- wa he, ri -- la -- da -- wo, o -- a -- wa he,
wo, o -- ri -- ra -- wo o rai -- da o -- rai -- da he
si wa ra -- i da
o -- rai -- da o -- rai -- da o -- rai -- da si wa -- rai -- da o,
o -- rai -- da he, wo -- sa rai -- da o -- rai -- da o -- o.
}

pirveliAltLyrics = \lyricmode
{
	he, ri -- la -- da -- wo,
}

meoribaniLyrics = \lyricmode
{
o, o -- ri -- ra -- wo o -- rai -- da o -- rai -- da he, (si wa -- ra -- i da)
o -- rai -- da o -- rai -- da o -- rai -- da si -- wa -- rai -- da o,
o -- rai -- da he, wo -- sa -- rai -- da o -- rai -- da o -- o.
}


pirveli = \relative c''
{
	\clef treble
	\time 15/4
	\repeat volta 3 {
	c8 ( d4. ) \tupletUp \times 2/3 { c4 b a } \tupletNeutral
	<<	
		{ e'2. f8 e d4 c2 \times 2/3 { b4 a g } b2 \fermata
		\once \override Staff.Clef #'stencil = ##f }
		\new Staff = topOssia \with {
		alignAboveContext = #"topIntro"
		\remove Clef_engraver
		\remove Time_signature_engraver
		firstClef = ##f
%		fontSize = #-3
%		\override StaffSymbol #'staff-space = #(magstep -3)
%		\override StaffSymbol #'thickness = #(magstep -3)
		}
		\new Voice = topAlt
		{ f'2.^\markup { \italic "on third repeat" } g8 f e4 d2 }
		\new Lyrics = "pirveliAlt"
		\with { alignAboveContext = "topIntro" }
		\lyricsto "topAlt"
		{ \pirveliAltLyrics }
	>>
	\breathe
	\time 11/4
	\bar "|" f2. e16[ f e d] e4 c c e e d g,-.
	\time 4/4
	\bar "|" d'4 b8 c4 b8 a4
	\time 15/4
	\bar "|" e'4 e d f d d e e e e8 d c4 b a2. \breathe
	\time 6/4
	\bar "|" f'4 f e f2.
	\time 23/8
	e4 e8 e4 f f e d c2. g2
	}
}


meori = \relative c''
{
	\clef treble
	s4*15
	\bar "|" b2. b16[ b b b] b4 g g b b a g-.
	\bar "|" \set fontSize = #-2 d'4_\markup
	{ \italic "on second repeat" } b8 c4 b8 a4
	\unset fontSize
	\bar "|" c4 c b d b b a a a a8 a a4 a a2. \breathe
	\bar "|" c4 c b d2. c4 c8 c4 d d c b a2. g2
}

bani = \relative c''
{
	\clef treble
	s4*15
	\bar "|" g2. g16[ g g g] g4 e e f f f g-.
	\bar "|" \set fontSize = #-2 d'4_\markup
	{ \italic "on third repeat" } b8 c4 b8 a4
	\unset fontSize
	\bar "|" g4 e e f d d e e e e8 e e4 e f2. \breathe
	\bar "|" g4 g g a2. a4 a8 a4 f g e e f2. g2
}

\score {
\new ChoirStaff = akhla \relative c'' {
<<
	\new Staff = topIntro
	\new Voice = "top"
	{ \pirveli }
	\new Lyrics
	\lyricsto "top"
	{ \pirveliLyrics }

	\new Voice = "middle"
	{ \meori }
	\new Lyrics
	\lyricsto "middle"
	\meoribaniLyrics
	
	\new Voice = "bottom"
	{ \bani }
	\new Lyrics
	\lyricsto "bottom"
	\meoribaniLyrics
>>
}

\layout {
	indent = 0 \cm
	firstpagenumber = no
	papersize = letter
    \context {
      \Staff
%     \remove Bar_engraver
      \remove Time_signature_engraver
%     \remove Clef_engraver
    }
}
}