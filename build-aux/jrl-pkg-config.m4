#                                                                -*-Autoconf-*-
# jrl-pkg-config.m4: detect dependencies using pkg-config.
# Copyright (C) 2009 by Thomas Moulard, AIST, CNRS, INRIA.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Additional permission under section 7 of the GNU General Public
# License, version 3 ("GPLv3"):
#
# If you convey this file as part of a work that contains a
# configuration script generated by Autoconf, you may do so under
# terms of your choice.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# serial 1

# ------ #
# README #
# ------ #

# This m4 file can be used to search for JRL package easily.

# Search for pkg-config dependencies.
m4_pattern_forbid([^JRL_])

# JRL_PKGCONFIGCHECK([VARIABLE_PREFIX], [PACKAGE_NAME])
# -----------------------------------------------------
# Check that a package is available and define a set of
# Autoconf variables.
AC_DEFUN([JRL_PKGCONFIGCHECK],
[PKGNAME=`echo "$2 " | cut -d' ' -f1`

 PKG_CHECK_MODULES([$1], [$2])
 AC_SUBST([$1_REQUIRED], ["$2"])
 AC_SUBST([$1_CFLAGS])
 AC_SUBST([$1_LIBS])
 AC_SUBST([$1_PREFIX], [`$PKG_CONFIG $PKGNAME --variable=prefix`])
 AC_SUBST([$1_DOCDIR], [`$PKG_CONFIG $PKGNAME --variable=docdir`])
 AC_SUBST([$1_DOXYGENDOCDIR],
	  [`$PKG_CONFIG $PKGNAME --variable=doxygendocdir`])
])

# JRL_PKGCONFIGCHECK_ADDDEP([VARIABLE_PREFIX], [PACKAGE_NAME])
# ------------------------------------------------------------
# Call JRL_PKGCONFIGCHECK and add package to pkg-config dependencies.
AC_DEFUN([JRL_PKGCONFIGCHECK_ADDDEP],
[JRL_PKGCONFIGCHECK([$1], [$2])
 PKGCONFIG_REQUIRES="$2, $PKGCONFIG_REQUIRES"
])
