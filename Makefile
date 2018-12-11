# $OpenBSD$
COMMENT=		machine management for a container-centric world

GH_TAGNAME=		v0.16.0
GH_ACCOUNT=		docker
GH_PROJECT=		machine
DISTNAME=		${GH_ACCOUNT}-${GH_PROJECT}-${GH_TAGNAME:C/^v//}

CATEGORIES=		sysutils

HOMEPAGE=		https://docs.docker.com/machine/

MAINTAINER=		Carlos Valiente <carlos@pepelabs.net>

# Apache 2.0
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += c pthread

MODULES=		lang/go

_GH_COMMIT_SHORT=	702c267f  # From: `git rev-parse --short ${GH_TAGNAME}`
MODGO_LDFLAGS+=		-X github.com/docker/machine/version.GitCommit=${_GH_COMMIT_SHORT}

# No `golint`package for OpenBSD.
NO_TEST=		Yes

do-build:
	cd ${WRKSRC} && ${MODGO_BUILD_CMD} ./cmd/docker-machine

.include <bsd.port.mk>
