\version "2.18.0"
\header {
	title = "Gojre Makshi"
	poet = "Svaneti, circa 1960s"
	composer = "As taught by Islam Pilpani, June 2007"
	tagline = ##f
}

#(set-default-paper-size "letter" 'portrait)
#(set-global-staff-size 18)

\paper { 
	markup-system-spacing #'padding = #5
	top-margin = 12
%	annotate-spacing = ##t
    system-system-spacing = 
      #'((basic-distance . 15) 
         (minimum-distance . 12) 
         (padding . 1) 
        (stretchability . 60)) 
 }


%{ Lyrics
===============================================================================
%}

stanzaOne = \lyricmode { %\set stanza = #"1."
	{
	  Go -- jre mak -- shi ma -- ma gvi -- ri,
	  Da -- li ki -- li ig  -- gvnikh ko -- jar. 
	  Im -- te a -- jadgh gush -- gwe -- i na -- vad, 
	  I -- me khar -- id kho -- cha gwa -- jar,
	  Im -- te a -- jadgh gush -- gwe -- i na -- vad, 
	  I -- me khar -- id kho -- cha gwa -- jar.
	}
}

%{ Music
===============================================================================
%}

pirveli = \relative c'' {
	\clef treble
	\time 8/4
	{
	e4.^ \mf e8 d4. e8 c c bes4 a2
	e'4. e8 d4. e8 c c bes4 a2
	c8. [d16] e8 [c] e [e16 f] e8 [d]
	c8 [d] ees [d] c [c] bes4 a2 r
	\once \override Score.RehearsalMark #'self-alignment-X = #LEFT
	\mark \markup { \small \italic "Hushed" }
	c8. [d16] e8 [c] e [e16 f] e8 [d]
	c8 [d] ees [d] c [c] bes4 a1 \bar "|."
	}
}

meori = \relative c'' {
	\clef treble
	\time 8/4
	{
	c4. c8 c4. bes8 bes a g4 a2
	c4. c8 c4. bes8 bes a g4 a2
	\time 12/4
	a8. [bes16] c8 [c] c [c16 c] c8 [bes]
	bes8 [bes] bes [c] bes [a] g4 a2 r
	a8. [bes16] c8 [c] c [c16 c] c8 [bes]
	bes8 [bes] bes [c] bes [a] g4 a1
	}
}

bani = \relative c'' {
	\clef treble
	\time 8/4
	{
	a4. f8 g4. e8 f f g4 a2
	a4. f8 g4. e8 f f g4 a2
	\time 12/4
	a8. [a16] a8 [f] g [g16 g] g8 [e]
	f8 [f] f [f] f [f] g4 a2 r
	d,8. [d16] d8 [d] e [e16 e] e8 [e]
	f8 [f] f [f] f [f] g4 a1
	}
}

%{ Layout
===============================================================================
%}

global = {
	\time 12/4
	\key d \minor
}

\score {
%\transpose c a
\new ChoirStaff %\with { \override StaffGrouper #'staffgroup-staff-spacing #'basic-distance = #10 }

	<<

	\new Voice = "pirveli"
	{ \global \pirveli }
	\new Lyrics
	\lyricsto "pirveli"
	\stanzaOne

	\new Voice = "meori"
	{ \global \meori }
	\new Lyrics
	\lyricsto "meori"
	\stanzaOne

	\new Voice = "bani" %\with { \consists "Volta_engraver" }
	{ \global \bani }
	\new Lyrics
	\lyricsto "bani"
	\stanzaOne
	
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
%	\fill-line {
%	\hspace #2
	\column{
	\line{ Verse \tiny \number 2. }
	\line{ Woi pise isgwe natsers, }
	\line{ Iori Misha gvak’ili Shvanärs, }
	\line{ Demkha anq’ad Gabliani }
	\line{ M’lchad asad ishgnag tanghärs \italic "(last two lines × 2)" }
	\line {   }
	\italic {
	\line { We have lost the masters of the cliffs }
	\line { The goddess Dali is crying, the cliffs are crying, }
	\line { “Where have our dreams gone? Where are you, noble men?” "		" }
	\line { Woe your unfortunate fate }
	\line {   }
	\line { Two men named Misha missing; two Svans }
	\line { and Gabliani didn’t return either, }
	\line { he has stayed to guard the high mountain peaks }
	}
	}
	\column {
	\line{ Verse \tiny \number 3. }
	\line{ Mama gviri Ushba muk’vshe, }
	\line{ Metkhviare Gio ghvazhräsh, }
	\line{ Mama gviri khocha Gano }
	\line{ Woi mat’kläb khocha ghvazhräsh \italic "(last two lines" \tiny \dynamic f \italic "× 2)" }
	\line {   }
	\italic {
	\line { We have lost the conquerors of Mount Ushba }
	\line { Gio, the hunter of ibex }
	\line { We have lost the good man Gano }
	\line { Oh, we miss you, noble men }
	}
	}
% }
}

%{
	\hspace #2
	}
}
	\hspace #2
%	\hspace #2
	\column{
	\line{ Verse \smaller \number 3. }
	\line{ Mama gviri ushba muk’vshe, }
	\line{ Metkhviare Gio ghvazhräsh, }
	\line{ Mama gviri khocha Gano }
	\line{ Woi mat’kläb khocha ghvazhräsh \italic "(last two lines × 2," \small \dynamic f \italic "both times)" }
	\line {   }
	}
	\hspace #2
	}
}



\markup {
	\fill-line {
%	\hspace #1
	\column {
	\italic {
	\line { We have lost the masters of the cliffs }
	\line { The goddess Dali is crying, the cliffs are crying, }
	\line { “Where have our dreams gone? Where are you, noble men?” }
	\line { Woe your unfortunate fate }
	\line {   }
	\line { Two men named Misha missing; two Svans }
	\line { and Gabliani didn’t return either, }
	\line { he has stayed to guard the high mountain peaks }
	}
	}
	
	\hspace #2
	\column {
	\italic {
	\line { We have lost the conquerors of Mount Ushba }
	\line { Gio, the hunter of ibex }
	\line { We have lost the good man Gano }
	\line { Oh, we miss you, noble men }
	}
	}
	\hspace #2
	}
}
%}