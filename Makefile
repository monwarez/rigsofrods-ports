# Reborn :	rigsofrods
# Created by: Thibault Payet <monwarez@mailoo.org>
# $FreeBSD$
#

PORTNAME=	rigsofrods
DISTVERSION=	0.4.8.0
CATEGORIES=	games

MAINTAINER=	monwarez@mailoo.org
COMMENT=	Truck, car, airplane, and boat simulator with advanced physics

LICENSE=	GPLv3+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libcurl.so:ftp/curl \
		libboost_system.so:devel/boost-libs \
		libgtk-x11-2.0.so:x11-toolkits/gtk20 \
		libOIS.so:devel/ois \
		libOgreMain.so:graphics/ogre3d \
		libCaelum.so:graphics/rigsofrods-caelum
BUILD_DEPENDS=	${LOCALBASE}/lib/libPagedGeometry.a:graphics/rigsofrods-pagedgeometry \
		${LOCALBASE}/lib/libMyGUI.OgrePlatform.a:x11-toolkits/mygui-ogre \
		${LOCALBASE}/lib/libSocketW.a:net/socketw \
		${LOCALBASE}/include/rapidjson/document.h:devel/rapidjson

USE_GITHUB=	yes
GH_ACCOUNT=	RigsOfRods
GH_PROJECT=	rigs-of-rods
GH_TAGNAME=	c37e6b5
#GH_TAGNAME=	c3089b3
#GH_TAGNAME=	80e9bfe

USES=	cmake dos2unix openal:soft gettext-runtime:lib \
	python:3.0+ pkgconfig ssl:build,run 

DOS2UNIX_GLOB=	*.cpp *.h *.txt
USE_WX=	3.0
USE_CXXSTD=	c++14
USE_XORG=	x11
USE_GCC=	yes
LDFLAGS+=	-lthr

# CG unavailable for FreeBSD
CMAKE_ARGS=	-DROR_USE_PAGED=TRUE \
		-DROR_USE_CAELUM=TRUE \
		-DROR_USE_SOCKETW=TRUE \
		-DROR_USE_ANGELSCRIPT=FALSE \
		-DCMAKE_CONFIGURATION_TYPES="Release" \
		-DCMAKE_SYSTEM_PREFIX_PATH=${LOCALBASE}
#		-DwxWidgets_CONFIG_EXECUTABLE="${WX_CONFIG}"

.include <bsd.port.mk>
