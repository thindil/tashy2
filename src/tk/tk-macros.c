/**
 * Copyright (c) 2020-2021 Bartek thindil Jasicki <thindil@laeran.pl>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Provides bindings for various Tk macros to use them in an Ada code

#include <tk.h>

/* ****f* tk-macros/tk-macros.Get_PathName
* FUNCTION
* Get the Tk path name for the selected Tk_Window
* PARAMETERS
* tkwin - Tk_Window which path name will be returned
* RESULT
* Tk path name of the selected Tk_Window
* HISTORY
* 8.6.0 - Added
* SOURCE */
char* Get_PathName(Tk_Window tkwin)
{
   return Tk_PathName(tkwin);
}
/* **** */

/* ****f* tk-macros/tk-macros.Get_Window_Id
* FUNCTION
* Get the window manager identifier for the selected Tk_Window
* PARAMETERS
* tkwin - Tk_Window which identifier will be returned
* RESULT
* The window manager identifier of the selected Tk_Window
* HISTORY
* 8.6.0 - Added
* SOURCE */
Window Get_Window_Id(Tk_Window tkwin)
{
   return Tk_WindowId(tkwin);
}
/* **** */
