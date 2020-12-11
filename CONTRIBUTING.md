## Bugs reporting

Bugs are not only problems or the library crashes, but also typos. If you
found any bug in the library, please report it at <https://www.laeran.pl/repositories/tashy2/ticket>

### Some general hints about reporting bugs

- In "One-line summary" field try to write short but not too general
  description of problem. Good example: "The library crash when opening
  directory". Bad example: "The library crashes often."
- Type: Select the type of ticket which in your opinion fits it best.
- Version: The version of the library. For the development version, please
  use word `trunk`
- In body/comment field try to write that much information about problem as
  possible. In most cases more information is better than less. General rule
  of good problem report is give enough information which allow reproducing
  problem by other people. It may be in form of steps which are needed for
  cause problem.

### Example of bug report:

One-line summary: "The library crashed when trying to run Tcl script"

Type: Code_Defect
Version: trunk

Body:

1. [Example of code which cause the problem]
2. [Backtrace which was generated on crash]

## Features propositions

If you want to talk/propose changes in any existing the library feature, feel
free to contact me via [project page](https://www.laeran.pl/repositories/tashy2/).
General rule about propositions is same as for bugs reports - please, try to
write that much information as possible. This help us all better understand
purpose of your changes.

## Code propositions

### General information

If you want to start help in the library development, please consider starts
from something easy like fixing bugs. Before you been want to add new feature
to the library, please contact with me by [project page](https://www.laeran.pl/repositories/tashy2/).
Same as with features proposition - your code may "collide" with my work and
it this moment you may just lose time by working on it. So it is better that
we first discuss your proposition. In any other case, fell free to fix my code.

### Coding standard

When you write your own code, feel free to use any coding standard you want.
But before you send your changes to the project, please use command `gnatpp`
which automatically format source code to project coding standard. Proper
`gnatpp` command usage (in main project directory, where *tashy2.gpr* file is):

`gnatpp -P tashy2.gpr`

#### Code comments formatting

The program uses [ROBODoc](https://rfsber.home.xs4all.nl/Robo/) for generating
code documentation. When you write your own code, please add proper header
documentation to it. If you use Vim/NeoVim, the easiest way is to use plugin
[RoboVim](https://github.com/thindil/robovim). Example of documentation
header:

    1 -- ****f* Utils/GetRandom
    2 -- FUNCTION
    3 -- Return random number from Min to Max range
    4 -- PARAMETERS
    5 -- Min - Starting value from which generate random number
    6 -- Max - End value from which generate random number
    7 -- RESULT
    8 -- Random number between Min and Max
    9 -- SOURCE
    10 function GetRandom(Min, Max: Integer) return Integer;
    11 -- ****

1 - Documentation header. TASHY2 uses `-- ****[letter]* [package]/[itemname]`
format for documentation headers.

2-9 - Documentation. For all available options, please refer to ROBODoc
documentation. TASHY2 uses `-- ` for start all documentation lines.

10 - Source code of item.

11 - Documentation footer. TASHY2 uses `-- ****` for closing documentation.

How to generate the code documentation is described in main *README.md* file.

### Code submission

Preferred way to submit your code is to use [tickets](https://www.laeran.pl/repositories/tashy2/ticket)
on the project page. Please attach to that ticket file with diff changes,
the best if done with command `fossil diff`. But any other diff program will
works. In that situation, please add information which program was used to
create the diff file.
