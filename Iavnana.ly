\version "2.14.2"
\header {
	title = "Iavnana"
	composer = "As taught by Kate Howard & Mzetamze"
	poet = "Racha"
	arranger = "Transcribed by Kate Howard & Colin Kinlund"
	tagline = ##f
}

#(set-default-paper-size "letter" 'portrait)
#(set-global-staff-size 20)

global = {
  \key a \minor
}

\paper { 
	markup-system-spacing #'padding = #3
	top-margin = 12
%	annotate-spacing = ##t
    system-system-spacing = 
      #'((basic-distance . 12) 
         (minimum-distance . 10) 
         (padding . 1) 
        (stretchability . 60)) 
 }

firstVoice = \lyricmode
{ %{ \set stanza = #"1." %}
I -- av -- na -- na, ba -- to -- ne -- bo, var -- do ba -- to -- ne -- bo.
I -- av -- na -- na, ba -- to -- ne -- bo, var -- do ba -- to -- ne -- bo.
Da t’kbit da t’kbit, da sho shin dit, var -- do ba -- to -- ne -- bo.
Da t’kbit da t’kbit, da sho shin dit, var -- do ba -- to -- ne -- bo.
}

pirveliEkhma = \lyricmode
{ %{ \set stanza = #"1." %}
ი -- ავ -- ნა -- ნა, ბა -- თო -- ნე -- ბო, ვარ -- დო ბა -- თო -- ნე -- ბო.
ი -- ავ -- ნა -- ნა, ბა -- თო -- ნე -- ბო, ვარ -- დო ბა -- თო -- ნე -- ბო.
და ტქბით და ტქბით, და შო შინ დით, ვარ -- დო ბა -- თო -- ნე -- ბო.
და ტქბით და ტქბით, და შო შინ დით, ვარ -- დო ბა -- თო -- ნე -- ბო.
}

pirveli = \relative c'' {
{ \clef "treble" %\override Staff.StaffSymbol #'line-count = #4
	\time 5/4 c4 d e e8( d4.)
	\time 6/4 d2 e8( d) c4 c2
	b2 c4 d d8( b4.)
	a2. a4-. r2 \break
	\time 5/4 cis4 d e e8( d4.)
	\time 6/4 d2 e8( d) c4 c2
	b2 c4 d d8( b4.)
	a2. a4-. r2 \break
	e'2 e4 c d2
	d2 e8( d) c4 c2
	b2 c4 d d8( b4.)
	a2. a4-. r2 \break
	cis4 d2 e4 e8( d4.)
	d2 e8( d) c4 c2
	b2 c4 d d8( b4.)
	a2. a4-. \skip 2 \bar "|." }
}

meori = \relative c'' {
{ \clef "treble" %\override Staff.StaffSymbol #'line-count = #4
	s1 s4
	a2 a4 a8( g) f2
	g2 g4 g g2
	a2. a4-. r2 
	a4 a a a2
	a2 a4 a8( g) f2
	g2 g4 g g2
	a2. a4-. r2
	s1 s2
	a2 a4 a8( g) f2
	g2 g4 g g2
	a2. a4-. r2
	a4 a2 a4 a2
	a2 a4 a8( g) f2
	g2 g4 g g2
	a2. a4-. \skip 2 \bar "|." }
} 

\score {
%\transpose a d'
\new ChoirStaff \with { \override StaffGrouper #'staffgroup-staff-spacing #'basic-distance = #10 }

	<< 
	\new Voice = "pirveli"
	{ \global \pirveli }
	\new Lyrics
	\lyricsto "pirveli"
	\firstVoice
	\new Lyrics
	\lyricsto "pirveli"
	\pirveliEkhma

	\new Voice = "meori"
	{ \global \meori }
%{	\new Lyrics
	\lyricsto "meori"
	\stanzaTwo
%}
	>>

\layout {
	indent = 0 \cm
	firstpagenumber = no
	papersize = letter
    \context {
      \Staff
%     \remove Bar_engraver
      \remove Time_signature_engraver
%      \remove Clef_engraver
    }
}
}

\markup { 
	\fill-line {
%	\hspace #2
	\column{
	\line{ “Iavnana” has the same mixture of soothing sounds and real words as “lullabye,” its translation. }
	\line{ The text roughly translates to, “Here are violets, little lord, here are roses, little lord, hush, sleep.” }
	\line{   }
	\line{ This would be sung to children sick in bed, with the offering of flowers meant to placate }
	\line{ the demons causing the child’s illness. }
	}
}
}