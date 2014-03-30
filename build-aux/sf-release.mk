#                                                                -*-Automake-*-
# Copyright (C) 2009 by Thomas Moulard, AIST, CNRS, INRIA.
# This file is part of the roboptim.
#
# roboptim is free software: you can redistribute it and/or modify
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
# roboptim is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with roboptim.  If not, see <http://www.gnu.org/licenses/>.

# ------ #
# README #
# ------ #
#
# Upload tarball to SourceForge server.

SF_VERSION=`echo '@PACKAGE_VERSION@'			\
	| $(GREP) '^[0-9]\+.[0-9]\+\(.[0-9]\+\|\)'$$`


SF_FRS_LOGIN=$$SF_USERNAME,$(SF_PROJECT_ID)
SF_FRS_PATH=/home/frs/project/`echo $(SF_PROJECT_ID) | head -c1`/` echo $(SF_PROJECT_ID) | head -c2`/$(SF_PROJECT_ID)/@PACKAGE_TARNAME@/@PACKAGE_VERSION@/

.PHONY: sf-dist-upload

# Generate a release.
sf-dist-upload: $(distdir).tar.gz $(distdir).tar.bz2 \
		$(distdir).tar.gz.sig $(distdir).tar.bz2.sig
	@if test x = x$(SF_VERSION) && test x = x$$SF_FORCE_UPLOAD; then\
	 echo "Development version are not uploaded to SourceForge.";	\
	 echo "Set SF_FORCE_UPLOAD to 1 to override.";			\
	 echo "Skipping...";						\
	else								\
	 echo "Publishing release on SourceForge...";			\
	 rsync -vPe ssh $^ $(SF_FRS_LOGIN)@frs.sourceforge.net:$(SF_FRS_PATH);\
	fi
