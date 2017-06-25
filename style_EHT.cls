% Slightly customized style file for the EHT notes
% If possible, don't edit this file: instead, edit macros.tex.
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style_EHT}
%
%[2016/7/8 Arun Debray's lecture minimal notes template]
%
% A template for lectures notes that makes few stylistic changes, but has lots of
% macros predefied for ease of live-TeXing.
%
% Provides a way to check whether this class is being used
\def\UsingNotesD{}
%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsbook}}
%
\ProcessOptions\relax
%
\LoadClass{amsbook}
\RequirePackage[utf8]{inputenc}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{graphicx}
\RequirePackage{mathtools}
\RequirePackage{xparse}
\RequirePackage{mathrsfs}
\RequirePackage[usenames, dvipsnames]{xcolor}
\RequirePackage[missing=MISSING, dirty={, plus uncommited changes}]{gitinfo2}
\RequirePackage[all]{xy}
\RequirePackage{adforn}
\RequirePackage[backref=page]{hyperref}
\RequirePackage[all]{hypcap}
% This has to be before cleveref, see http://tex.stackexchange.com/questions/126364
\numberwithin{equation}{section}
\RequirePackage[capitalize, noabbrev]{cleveref}
% Some shortcuts that simplify live-TeXing using XY.
%
% Forces all XY entries to be typeset with displaymath, which is much more
% common for me
\everyentry={\displaystyle}
%
% Short exact sequences: write
% \shortexact[f][g]{A}{B}{C}, for:
%
% f g
% 0 -> A -> B -> C -> 0,
\DeclareDocumentCommand{\shortexact}{O{} O{} mmmm}{
\xymatrix{
 0\ar[r] & #3\ar[r]^-{#1} & #4\ar[r]^-{#2} & #5\ar[r] & 0#6
}}
% exactly the same, but for 0 -> A -> B -> C
\DeclareDocumentCommand{\leftexact}{O{} O{} mmmm}{
\xymatrix{
 0\ar[r] & #3\ar[r]^-{#1} & #4\ar[r]^-{#2} & #5 #6
}}
% ... and the same, for A -> B -> C -> 0
\DeclareDocumentCommand{\rightexact}{O{} O{} mmmm}{
\xymatrix{
 {#3}\ar[r]^-{#1} & #4\ar[r]^-{#2} & #5\ar[r] & 0#6
}}
%
% Double right arrow, which I found myself writing a lot (e.g. equalizer, kernel,
% or cokernel diagrams)
% usage:
% X\dblarrow[r][f][g] & Y
% f
% X => Y
% g
% Since LaTeX is parsing a class file, we need to tell it that @ is not part of the
% \ar command, or we get some opaque errors.
\makeatother
\DeclareDocumentCommand{\dblarrow}{O{} O{} O{}}{%
 \ar@<0.4ex>[#1]^-{#2}\ar@<-0.4ex>[#1]_-{#3}%
}
% Note: it would be a useful exercise to figure out how to define this so it can
% be used as \dblarrow[r]^f_g.
%
% Useful for morphisms in overcategories (aka slice categories), such as vector bundles,
% covering spaces, field extensions, schemes over a base... or just commutative triangles
% Usage: \overtriangle[f][\pi_1][\pi_2]{X_1}{X_2}{B}.
% Note: the last argument is punctuation; if you don't want punctuation, pass it as {}
\DeclareDocumentCommand{\overtriangle}{O{} O{} O{} mmmm}{
\xymatrix@C=0.4cm{
 {#4}\ar[rr]^{#1}\ar[dr]_{#2} && {#5}\ar[dl]^{#3}\\ % comment for cpp. Don't delete
 & {#6 #7}
}}
\makeatletter
%
% TODO: do I want these going in the other direction?
% Source: http://tug.org/pipermail/xy-pic/2001-July/000015.html
\newcommand{\pullbackcorner}[1][dr]{\save*!/#1+1.2pc/#1:(1,-1)@^{|-}\restore}
\newcommand{\pushoutcorner}[1][dr]{\save*!/#1-1.2pc/#1:(-1,1)@^{|-}\restore}
%
% TODO more? Especially pullback or pushout squares.
%
% An xymatrix environment wrapped in gathered to ensure its equation number is vertically centered
\newcommand{\gathxy}[2][]{%
\begin{gathered}
\xymatrix#1{#2}
\end{gathered}
}
% Mathematicians have lots of fancy fonts
% \mathbb -- notable sets
% TODO: would be nice to allow people to override \mathbb with \mathbf
\newcommand{\A}{\mathbb A} % affine space
\newcommand{\C}{\mathbb C} % complex numbers
\newcommand{\D}{\mathbb D} % unit disc inside \C
\newcommand{\E}{\mathbb E} % expected value, family of operads
\newcommand{\F}{\mathbb F} % finite fields
\newcommand{\G}{\mathbb G} % additive/multiplicative groups
\AtBeginDocument{ % some fonts redefine this (e.g. charter)
 \renewcommand{\H}{\mathbb H} % quaternions, upper half-plane
}
\newcommand{\N}{\mathbb N} % natural numbers
\renewcommand{\P}{\mathbb P} % probability, projective space
\newcommand{\Q}{\mathbb Q} % rational numbers
\newcommand{\R}{\mathbb R} % real numbers
\newcommand{\Sph}{\mathbb S} % sphere spectrum
\newcommand{\T}{\mathbb T} % circle group
\newcommand{\Z}{\mathbb Z} % integers
\newcommand{\RP}{\mathbb{RP}} % real projective space
\newcommand{\CP}{\mathbb{CP}} % complex projective space
% \mathcal -- lots of different things
\newcommand{\cA}{\mathcal A} % Steenrod algebra, etc.
\newcommand{\cM}{\mathcal M} % moduli space
% \mathfrak -- Lie algebras, open covers, prime ideals
\newcommand{\p}{\mathfrak p} % prime ideal
\newcommand{\q}{\mathfrak q} % another prime ideal
\newcommand{\m}{\mathfrak m} % maximal ideal
\newcommand{\fg}{\mathfrak g} % general Lie algebra
\newcommand{\gl}{\mathfrak{gl}} % general linear Lie algebra
\renewcommand{\sl}{\mathfrak{sl}} % special linear
\renewcommand{\sp}{\mathfrak{sp}} % symplectic
\newcommand{\fo}{\mathfrak o} % orthogonal
\newcommand{\so}{\mathfrak{so}} % special orthogonal
\newcommand{\fu}{\mathfrak u} % unitary
\newcommand{\su}{\mathfrak{su}} % special unitary
\newcommand{\fU}{\mathfrak U} % open covers, à la Bott-Tu
% \mathrm -- usually Lie groups
\newcommand{\GL}{\mathrm{GL}} % general linear
\newcommand{\SL}{\mathrm{SL}} % special linear
\AtBeginDocument{ % redefined by mathdesign
 \renewcommand{\O}{\mathrm O} % orthogonal
}
\newcommand{\SO}{\mathrm{SO}} % special orthogonal
\newcommand{\U}{\mathrm U} % unitary
\newcommand{\SU}{\mathrm{SU}} % special unitary
\newcommand{\Sp}{\mathrm{Sp}} % symplectic
\newcommand{\Spin}{\mathrm{Spin}} % spin
\newcommand{\PGL}{\mathrm{PGL}} % projective general linear
\newcommand{\PSL}{\mathrm{PSL}} % projective special linear
% \mathscr -- usually sheaves
\newcommand{\sF}{\mathscr F} % sheaf
\newcommand{\sG}{\mathscr G} % sheaf
\newcommand{\sH}{\mathscr H} % sheaf
\newcommand{\sI}{\mathscr I} % sheaf of ideals, index category
\newcommand{\sL}{\mathscr L} % line bundle
\newcommand{\sM}{\mathscr M} % quasicoherent sheaf
\newcommand{\sO}{\mathscr O} % ring of functions
% \mathsf -- categories
\newcommand{\cat}{\mathsf}
% The user can redefine \cat to be something else (e.g. mathbf). However, I'd also
% like them to be able to redefine things like Set, Grp, and so forth without having
% to use AtBeginDocument.
% TODO: do I even need this AtBeginDocument here...?
% TODO: add a \newcat{} command.
\AtBeginDocument{
 \newcommand{\fC}{\cat C}
 \newcommand{\fD}{\cat D}
 \newcommand{\Set}{\cat{Set}} % sets
 \newcommand{\Grp}{\cat{Grp}} % groups
 \newcommand{\Gpd}{\cat{Gpd}} % groupoids
 \newcommand{\Ab}{\cat{Ab}} % abelian groups
 \newcommand{\Ring}{\cat{Ring}} % rings
 \newcommand{\Mod}{\cat{Mod}} % modules (over a ring)
 \newcommand{\Alg}{\cat{Alg}} % algebras (over a ring)
 \newcommand{\Vect}{\cat{Vect}} % vector spaces (over a field)
 \def\Top{\cat{Top}} % topological space (sometimes already defined, e.g. by kpfonts)
 % TODO what other categories of topological/geometric objects do I need?
 \newcommand{\LocRing}{\cat{LocRing}} % locally ringed spaces
 \newcommand{\AffSch}{\cat{AffSch}} % affine schemes
 \newcommand{\Sch}{\cat{Sch}} % schemes
 \newcommand{\Man}{\cat{Man}} % manifolds
 \newcommand{\Fun}{\cat{Fun}} % functor categories
}
% Setting up some theorem environments
%
% The "exampx" and similar provisional environments are in use so that I can
% append a marker at the end of examples, remarks, claims, facts, and notes.
% (Of course, it would be good for me to determine how to do this automatically.)
% Source: http://tex.stackexchange.com/a/32394/
%
\newtheorem{thm}[equation]{Theorem}
\newtheorem{lem}[equation]{Lemma}
\newtheorem{cor}[equation]{Corollary}
\newtheorem{prop}[equation]{Proposition}
\newtheorem{claim}[equation]{Claim}
\theoremstyle{definition}
\newtheorem{ex}[equation]{Exercise}
\newtheorem{exampx}[equation]{Example}
\newtheorem{defn}[equation]{Definition}
\theoremstyle{remark}
\newtheorem*{remx}{Remark}
\newtheorem*{fctx}{Fact}
\newtheorem*{notex}{Note}
%
%
\newcommand{\exampleQED}{\smash\adfhalfleftarrowhead}
\newenvironment{exm}
  {\pushQED{\qed}\renewcommand{\qedsymbol}{\exampleQED}\exampx}
  {\popQED\endexampx}
\newenvironment{rem}
  {\pushQED{\qed}\renewcommand{\qedsymbol}{\exampleQED}\remx}
  {\popQED\endremx}
\newenvironment{fct}
  {\pushQED{\qed}\renewcommand{\qedsymbol}{\exampleQED}\fctx}
  {\popQED\endfctx}
\newenvironment{note}
  {\pushQED{\qed}\renewcommand{\qedsymbol}{\exampleQED}\notex}
  {\popQED\endnotex}
%
% Another possibility: "definition-theorems" as used in universal properties
% I will probably also want starred theorems (propositions, subsections, etc.).
%
% This could be considered a stylistic choice, but works much better with how I use
% subsections as subject changes in a lecture.
\setcounter{tocdepth}{1}
%
% These can be changed downstream
\newcommand{\latin}{\textit} % e.g. \latin{per se}, \latin{mutatis mutandis}
%
% Often, I find myself making a theorem, definition, etc. that's purely a combination
% of statements, either bulleted or numbered. In that case, using \hfill typesets each
% item uniformly. It would probably be best to make this into a custom enumitem
% environment, especially if I want to refer to specific items (e.g. 12.2.1 inside
% Theorem 12.2).
% Usage: \begin{comp}{thm}{enumerate}
% \item
% \end{comp}
% sets up an enumerate environment inside a theorem.
\NewDocumentEnvironment{comp}{mm}{%
 \csname #1\endcsname\hfill
 \csname #2\endcsname
}{
 \csname end#2\endcsname
 \csname end#1\endcsname
}
%
% other shortcuts I use for live-TeXing
\newcommand{\vp}{\varphi}
\newcommand{\e}{\varepsilon}
\newcommand{\inj}{\hookrightarrow}
\newcommand{\surj}{\twoheadrightarrow}
\newcommand{\id}{\mathrm{id}}
\newcommand{\pt}{\mathrm{pt}}
\newcommand{\many}[2][\dotsb]{#2 #1 #2} % optional argument for kind of dots
\newcommand{\TFAE}{The following are equivalent}
%
% use a longer \mapsto in display math
\let\shortmapsto\mapsto
\renewcommand{\mapsto}{\mathchoice{\longmapsto}{\shortmapsto}{\shortmapsto}{\shortmapsto}}
%
% Use \ud for things that need additional space, e.g. f(x) dx (in integrals or for
% differential forms). \d is for things that don't (e.g. after a wedge, or just dx on
% its own). I would be interested in unifying them.
% Some packages that I use often (e.g. font packages) overwrite \d, and therefore this
% class needs to define \d after it's overwritten, which is why I use \AtBeginDocument.
\AtBeginDocument{
 \newcommand{\ud}{\,\mathrm{d}}
 \renewcommand{\d}{\mathrm d}
 % accepts optional argument for higher derivatives
 \newcommand{\dfr}[3][]{\frac{\mathrm d^{#1} #2}{\mathrm d #3{}^{#1}}}
 \newcommand{\@dpfr}[3][]{\frac{\partial^{#1} #2}{\partial #3{}^{#1}}}
 \newcommand{\@spfr}[3][]{\partial^{#1} #2 / \partial #3{}^{#1}}
 \newcommand{\pfr}[3][]{\mathchoice{\@dpfr[#1]{#2}{#3}}{\@dpfr[#1]{#2}{#3}}
  {\@spfr[#1]{#2}{#3}}{\@spfr[#1]{#2}{#3}}}
}
%
% This allows \paren{...} to replace \left(...\right) (and similarly for \bkt). For
% \ang, \set, \abs, and \norm, I find myself using autoexpansion less often.
% This code, along with some other shortcuts, is duplicated in my problem set template;
% perhaps I should have them include a common file?
\DeclarePairedDelimiter\paren{(}{)}
\DeclarePairedDelimiter\ang{\langle}{\rangle}
\DeclarePairedDelimiter\abs{\lvert}{\rvert}
\DeclarePairedDelimiter\norm{\lVert}{\rVert}
\DeclarePairedDelimiter\bkt{[}{]}
\DeclarePairedDelimiter\set{\{}{\}}
% Swap paren* and paren, etc., so that the normal version resizes by default.
% Meanwhile, one can use \paren*[\Big]{...} to customize the size easily.
\let\oldparen\paren
\def\paren{\@ifstar{\oldparen}{\oldparen*}}
\let\oldbkt\bkt
\def\bkt{\@ifstar{\oldbkt}{\oldbkt*}}
%
% This allows a"1 as a shortcut for a^{(1)} and a"{10} as a shortcut for a^{(10)}.
\AtBeginDocument{\catcode`\"=13}
\catcode`\"=13
\newcommand*{"}[1]{^{(#1)}}%
\catcode`\"12
%
% Now, for a bunch of field-specific commands.
%
% Algebra
\DeclareMathOperator{\Ann}{Ann}
\DeclareMathOperator{\Aut}{Aut}
\DeclareMathOperator{\Cliff}{Cliff}
\DeclareMathOperator{\chr}{char}
\DeclareMathOperator{\coker}{coker}
\DeclareMathOperator{\End}{End}
\DeclareMathOperator{\Ext}{Ext}
\DeclareMathOperator{\Frac}{Frac}
\DeclareMathOperator{\Gal}{Gal}
\DeclareMathOperator{\Hom}{Hom}
\AtBeginDocument{ % some packages redefine this
 \renewcommand{\Im}{\operatorname{Im}} % also complex analysis
}
%\DeclareMathOperator{\ker}{ker}
\DeclareMathOperator{\Mat}{Mat}
\newcommand{\op}{^{\cat{op}}} % for the opposite of a category
\DeclareMathOperator{\sign}{sign}
\DeclareMathOperator{\spa}{span}
\DeclareMathOperator{\Stab}{Stab}
\DeclareMathOperator{\Sym}{Sym}
%TODO better name (conflicts w/ circle group)
%\newcommand{\T}{^{\mathrm T}} % tranpose TODO where does the \! go?
\DeclareMathOperator{\Tor}{Tor}
\newcommand{\bl}{\text{--}}
%
% Algebraic Geometry
\DeclareMathOperator{\Proj}{Proj}
\DeclareMathOperator{\QCoh}{QCoh}
\DeclareMathOperator{\res}{res} % also complex analysis
\DeclareMathOperator{\Spec}{Spec}
%
% Algebraic Topology
\newcommand{\Gr}{\mathrm{Gr}} % Grassmannian -- perhaps move to letters.tex
\newcommand{\hdr}{H_{\text{\rm dR}}}
\newcommand{\KO}{\mathit{KO}} % should I add reduced K and KO?
\newcommand{\wH}{\widetilde H}
\DeclareMathOperator*{\colim}{colim} % colimit notation in homotopy theory
\DeclareMathOperator*{\holim}{holim} % homotopy limit
\DeclareMathOperator*{\hocolim}{hocolim} % homotopy colimit
%
% Complex analysis
% note: Re and Im changes are technically style changes, but almost everyone uses this notation
\AtBeginDocument{
 \renewcommand{\Re}{\operatorname{Re}}
}
\newcommand{\delbar}{\overline\partial}
%
% Topology
\DeclareMathOperator{\codim}{codim}
\DeclareMathOperator{\crit}{crit}
\DeclareMathOperator{\curl}{curl}
\renewcommand{\div}{\operatorname{div}}
\DeclareMathOperator{\ind}{ind}
\DeclareMathOperator{\supp}{supp}
%
%
\RequirePackage{fancyhdr}
% after the font has been chosen
\AtBeginDocument{
 \usepackage{microtype}
}
%
% Set colors for hyperref
\hypersetup{
 colorlinks,
 linkcolor={red!50!black},
 citecolor={green!50!black},
 urlcolor={blue!80!black}
}
%
% Ornament to divide different parts of a section without introducing a new subsection
\newcommand{\orbreak}{
\begin{center}
 \adforn{17}\;\(\cdot\)\;\adforn{18}
 \vspace{0.2cm}
\end{center}
}
%
% some other stylistic changes
\renewcommand{\vec}[1]{\boldsymbol{\mathbf{#1}}}
\def\qedsymbol{{\small{\ensuremath{\boxtimes}}}}
\renewcommand{\emptyset}{\varnothing}
%
\newcommand*{\coursenum}[1]{\newcommand{\@coursenum}{#1}}
\newcommand*{\coursename}[1]{\newcommand{\@coursename}{#1}}
%
\renewcommand{\thesection}{\thechapter.\arabic{section}}
%
% These things should be defined after the user sets everything up in the preamble
\AtBeginDocument{
 % Fancy headers
 % TODO this doesn't work like I want it to, and I don't know how to fix it.
 \renewcommand{\sectionmark}[1]{\markleft\thesection. #1}
 %
 \fancyhf{}
 \fancyhead[RO,LE]{\small\thepage}
 \fancyhead[LO]{\small\itshape\nouppercase{\leftmark}}
 \fancyhead[RE]{\small\itshape \@coursenum{} (\@coursename) Lecture Notes}
 \setlength{\headheight}{11.0pt}
 \pagestyle{fancy}
}
