!  _________
! /         \ tinyfiledialogs v3.10 [Mar 25, 2023] zlib licence
! |tiny file| 
! | dialogs | Copyright (c) 2014 - 2023 Guillaume Vareille http://ysengrin.com
! \____  ___/ http://tinyfiledialogs.sourceforge.net
!      \|     git clone http://git.code.sf.net/p/tinyfiledialogs/code tinyfd

! - License -
! This software is provided 'as-is', without any express or implied
! warranty.  In no event will the authors be held liable for any damages
! arising from the use of this software.
! Permission is granted to anyone to use this software for any purpose,
! including commercial applications, and to alter it and redistribute it
! freely, subject to the following restrictions:
! 1. The origin of this software must not be misrepresented; you must not
! claim that you wrote the original software.  If you use this software
! in a product, an acknowledgment in the product documentation would be
! appreciated but is not required.
! 2. Altered source versions must be plainly marked as such, and must not be
! misrepresented as being the original software.
! 3. This notice may not be removed or altered from any source distribution.


	module tinyfd_module
		interface ! C interface

			! it doesn't return anything -> it's a subroutine
			subroutine tinyfd_beep() bind(C, name='tinyfd_beep')
				implicit none
			end subroutine tinyfd_beep

			! it returns one value -> it's a function
			integer function tinyfd_notifyPopup(aTitle, aMessage, aIconType) bind(c, NAME='tinyfd_notifyPopup')
				use iso_c_binding, only: c_char
				implicit none
				character (kind=c_char, len=1) :: aTitle, aMessage, aIconType
			end function tinyfd_notifyPopup

			! it returns one value -> it's a function
			integer function tinyfd_messageBox(aTitle, aMessage, aDialogType, aIconType,	&
					aDefaultButton) bind(c,NAME='tinyfd_messageBox')
				use iso_c_binding, only: c_char, c_int
				implicit none
				character (kind=c_char, len=1) :: aTitle, aMessage, aDialogType, aIconType
				integer(c_int), value :: aDefaultButton
			end function tinyfd_messageBox

			! it returns one value -> it's a function
			type(c_ptr) function tinyfd_inputBox(aTitle, aMessage, aDefaultInput) bind(c,NAME='tinyfd_inputBox')
				use iso_c_binding, only: c_ptr, c_char
				implicit none
				character (kind=c_char, len=1) :: aTitle, aMessage, aDefaultInput
			end function tinyfd_inputBox

			! it returns one value -> it's a function
			type(c_ptr) function tinyfd_saveFileDialog(aTitle, aDefaultPathAndFile, aNumOfFilterPatterns,	&
					aFilterPatterns, aSingleFilterDescription) bind(c,NAME='tinyfd_saveFileDialog')
				use iso_c_binding, only: c_ptr, c_char, c_int
				implicit none
				character (kind=c_char, len=1) :: aTitle, aDefaultPathAndFile, aFilterPatterns, aSingleFilterDescription
				integer(c_int), value :: aNumOfFilterPatterns
			end function tinyfd_saveFileDialog

			! it returns one value -> it's a function
			type(c_ptr) function tinyfd_openFileDialog(aTitle, aDefaultPathAndFile, aNumOfFilterPatterns,	&
					aFilterPatterns, aSingleFilterDescription, aAllowMultipleSelects) bind(c,NAME='tinyfd_openFileDialog')
				use iso_c_binding, only: c_ptr, c_char, c_int
				implicit none
				character (kind=c_char, len=1) :: aTitle, aDefaultPathAndFile, aFilterPatterns, aSingleFilterDescription
				integer(c_int), value :: aNumOfFilterPatterns, aAllowMultipleSelects
			end function tinyfd_openFileDialog

			! it returns one value -> it's a function
			type(c_ptr) function tinyfd_selectFolderDialog(aTitle, aDefaultPath) bind(c,NAME='tinyfd_selectFolderDialog')
				use iso_c_binding, only: c_ptr, c_char
				implicit none
				character (kind=c_char, len=1) :: aTitle, aDefaultPath
			end function tinyfd_selectFolderDialog

			! it returns one value -> it's a function
			type(c_ptr) function tinyfd_colorChooser(aTitle, aDefaultHexRGB) bind(c,NAME='tinyfd_colorChooser')
				use iso_c_binding, only: c_ptr, c_char, c_int
				implicit none
				character (kind=c_char, len=1) :: aTitle, aDefaultHexRGB
				character(3) :: aDefaultRGB, aoResultRGB
			end function tinyfd_colorChooser

		end interface ! C interface
	end module tinyfd_module

