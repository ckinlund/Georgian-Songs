\version "2.14.2"
\header {
	title = "Alilo"
	poet = "Lenjeri (Svaneti)"
	composer = "As taught by Islam Pilpani, June 2007"
	arranger = "Transcribed by Colin Kinlund"
	tagline = ##f
}

#(set-default-paper-size "letter" 'portrait)
#(set-global-staff-size 19)

\paper { 
	markup-system-spacing #'padding = #5
	top-margin = 12
%	annotate-spacing = ##t
    system-system-spacing = 
      #'((basic-distance . 20) 
         (minimum-distance . 15) 
         (padding . 1) 
        (stretchability . 60)) 
}
%}

%{ Lyrics
===============================================================================
%}

introVoice = \lyricmode
	{ Wo di wo, }

stanzaOnePirveli = \lyricmode
	{ \repeat volta 2
	{ wo -- i -- a -- li -- lo -- sa, }
	\alternative {
	{ ta -- i -- a -- li -- lo sa da a -- li -- lo -- sa ta -- li -- lo, }
	{ na -- i -- a -- pe -- khi sa da ekh -- sa -- pekh -- sa na -- pe -- khi -- sa, }
	}
}

stanzaOne = \lyricmode
	{ %\set stanza = #"1."
	\repeat volta 2
	{ wo -- i -- a -- li -- lo -- sa, }
	\alternative {
	{ ta -- i -- a -- li -- lo sa da a -- li -- lo -- sa ta -- li -- lo, }
	{ na -- i -- a -- pe -- khi sa da ekh -- sa -- pekh -- sa na -- pe -- khi -- sa, }
	}
}

stanzaTwoPirveli = \lyricmode
	{ %\set stanza = #"2."
	\skip8 \skip8 \skip4 wo -- i -- ekh -- sa -- pekh -- sa,
	}

stanzaTwo = \lyricmode
	{ %\set stanza = #"2."
	wo -- i -- ekh -- sa -- pekh -- sa,
	}

%{ Music
===============================================================================
%}

pirveli = \relative c'' {
	\clef "treble" \key d \minor %\override Staff.StaffSymbol #'line-count = #4
%	\bar "|:"
	\repeat volta 2
	{
		\partial 2 d8 e d4 \bar "’" e4. f8 e4 e8( d) c2 bes-. \break
	}
	\alternative
	{ 
		{ e4. f8 e8( f) e( d) c2 d4. bes8 c4 d ees d c bes a2-. }
		{ e'4. f8 e8( f) e( d) c2 d4. bes8 c4 d ees d c bes a4
		\override NoteHead #'style = #'cross d, \bar "|."
		}
	}
}

meori = \relative c'' {
	\clef "treble" \key d \minor %\override Staff.StaffSymbol #'line-count = #4
	\repeat volta 2
	{
		\partial 2 s2 d4. d8 c( d) c( bes) bes4( aes) g2-.
	}
	\alternative
	{
		{ d'4. d8 c( d) c( bes) bes4( a) c4. bes8 bes4 bes bes bes a g a2-. }
		{ d4. d8 c( d) c( bes) bes4( a) c4. bes8 bes4 bes bes bes a g a
		\override NoteHead #'style = #'cross d,
		}
	}
}

bani = \relative c'' {
	\clef "treble" \key d \minor %\override Staff.StaffSymbol #'line-count = #4
	\repeat volta 2
	{
		\partial 2 s2 a4. a8 a4 g f2 g-.
	}
	\alternative
	{ 
		{ a4. a8 a4 a8( g) f2 g4. e8 f4 f f f f g a2-. }
		{ d,4. d8 d4 d8( e) f2 g4. e8 f4 f f f f g a
		\override NoteHead #'style = #'cross d,
		}
	}
}

\score {
\new ChoirStaff {

	<<
	\time 8/4
	
	\new Voice = "pirveli"
	{ \pirveli }
	\new Lyrics
	\lyricsto "pirveli"
	{ \introVoice \stanzaOnePirveli }
	\new Lyrics
	\lyricsto "pirveli"
	\stanzaTwoPirveli
	
	\new Voice = "meori"
	{ \meori }
	\new Lyrics
	\lyricsto "meori"
	\stanzaOne
	\new Lyrics
	\lyricsto "meori"
	\stanzaTwo
	
	\new Voice = "bani"
	{ \bani }
	\new Lyrics
	\lyricsto "bani"
	\stanzaOne
	\new Lyrics
	\lyricsto "bani"
	\stanzaTwo
		
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

\markup { \column{
  \line { Verse \tiny \number 3. }
  \line { (Wo di wo,) }
  \line { Wo-i a-ul ga-ul, }
  \line { Wo-i pekh-shish ga-ul }
  \line { da a-ul ga-ul pekh-shish ga-ul. }
  }
}