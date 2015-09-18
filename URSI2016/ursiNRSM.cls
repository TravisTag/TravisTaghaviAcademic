%----------------------------------------------------------------------
% Abstract class 'ursi2005' for AP-S/URSI 2005 conference 
%
%
% Comments and questions to Nathan Cummings <npc@ieee.org>
%----------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ursiNRSM}
[2004/12/05 v0.1 Abstract class for AP-S/URSI 2005 Conference]
\LoadClass[11pt,letterpaper]{article}

\usepackage{amssymb}
\usepackage{ifthen}

\setlength{\topskip}{0in}
\setlength{\headheight}{0in}
\setlength{\headsep}{0in}
\setlength{\topsep}{0in}
\setlength{\textheight}{9in}
\setlength{\textwidth}{5.5in}
\setlength{\oddsidemargin}{.5in}
\setlength{\topmargin}{0.3in}
\setlength{\parskip}{12pt}
\setlength{\parindent}{0pt}
\pagestyle{empty}

\renewcommand{\title}[1]{\newcommand{\URSI@title}{#1}}

\newcounter{author}
\renewcommand{\author}[2][]{
   \stepcounter{author}
   \@namedef{author@\theauthor}{#2}
   \@namedef{authorlabel@\theauthor}{#1}
}

\newcounter{address}
\newcommand{\address}[2][]{
   \stepcounter{address}
   \@namedef{address@\theaddress}{#2}
   \@namedef{addresslabel@\theaddress}{#1}
}

\newcommand{\alsep}{and}

\renewenvironment{abstract}{%
  % Add the formatted title
  \begin{center}%
    \begin{minipage}{4.75in}%
      \begin{center}%
    \begin{bfseries}\URSI@title\\\end{bfseries}
    \vspace{1ex}
    \newcounter{c@author}
    \newcounter{c@tmp}
    \ifthenelse{\value{author}=2}{%
      \newcommand{\liand}{ and }}{%
      \newcommand{\liand}{, and }}
    % Next add the authors
    \ifthenelse{\value{address}<2}{%
      %No address references required if there is only one
      \@nameuse{author@1}%
      \stepcounter{c@author}%
      \whiledo{\value{c@author}<\value{author}}{%
        \setcounter{c@tmp}{\value{author}}%
        \addtocounter{c@tmp}{-\value{c@author}}%
        \ifthenelse{\value{c@tmp}=1}{%
          \renewcommand{\alsep}{\liand}}{\renewcommand{\alsep}{, }}%
        \stepcounter{c@author}\alsep \@nameuse{author@\thec@author}}\\%
    }
    {%Add address references after the author's name
      \@nameuse{author@1}${}^{\ref{\@nameuse{authorlabel@1}}}$%
      \stepcounter{c@author}%
      \whiledo{\value{c@author}<\value{author}}{%
      \setcounter{c@tmp}{\value{author}}%
      \addtocounter{c@tmp}{-\value{c@author}}%
      \ifthenelse{\value{c@tmp}=1}{%
        \renewcommand{\alsep}{\liand}}{\renewcommand{\alsep}{, }}%
      \stepcounter{c@author}\alsep \@nameuse{author@\thec@author}%
        ${}^{\ref{\@nameuse{authorlabel@\thec@author}}}$%
      }
    }
%    \theaddress
    \vspace{0.2ex}

    \ifthenelse{\value{address}>0}{%
      \ifthenelse{\value{address}=1}{
        %Output the address without any reference symbols
       %%        {\slshape\small \@nameuse{address@1}}
        {\@nameuse{address@1}}
      }
      {%Output the addresses as an enumerated list
        \newcounter{c@address}

        \begin{center}
        \whiledo{\value{c@address}<\value{address}}
        {
          \refstepcounter{c@address}
            ${}^\thec@address$\,%
              \label{\@nameuse{addresslabel@\thec@address}}%
              \@nameuse{address@\thec@address}\\ %
        }
        \end{center}
      
      } % end of the address creation ifthenelse block
    }
    {
      \relax
    }
    \end{center}
    \end{minipage}

  \end{center}

}{

\relax

\relax}



