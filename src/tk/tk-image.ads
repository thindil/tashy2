-- Copyright (c) 2021 Bartek thindil Jasicki <thindil@laeran.pl>
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

with Tcl.Lists; use Tcl.Lists;

-- ****d* Tk/Image
-- FUNCTION
-- Provides code for manipulate Tk images
-- SOURCE
package Tk.Image is
-- ****

   type Tk_Image is new String;

   procedure Delete(Image: Tk_Image) with
      Pre => Image'Length > 0,
      Test_Case => (Name => "Test_Image_Delete", Mode => Nominal);

   procedure Delete(Images: Array_List) with
      Pre => Images'Length > 0,
      Test_Case => (Name => "Test_Image_Delete2", Mode => Nominal);

   function Height(Image: Tk_Image) return Natural with
      Pre => Image'Length > 0,
      Test_Case => (Name => "Test_Image_Height", Mode => Nominal);

   function In_Use(Image: Tk_Image) return Boolean with
      Pre => Image'Length > 0,
      Test_Case => (Name => "Test_Image_In_Use", Mode => Nominal);

   function Names return Array_List with
      Test_Case => (Name => "Test_Image_Names", Mode => Nominal);

   function Image_Type(Image: Tk_Image) return String with
      Pre => Image'Length > 0,
      Test_Case => (Name => "Test_Image_Type", Mode => Nominal);

   function Types return Array_List with
      Test_Case => (Name => "Test_Image_Types", Mode => Nominal);

   function Width(Image: Tk_Image) return Natural with
      Pre => Image'Length > 0,
      Test_Case => (Name => "Test_Image_Width", Mode => Nominal);

end Tk.Image;
