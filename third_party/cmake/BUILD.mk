#-*-mode:makefile-gmake;indent-tabs-mode:t;tab-width:8;coding:utf-8-*-┐
#── vi: set noet ft=make ts=8 sw=8 fenc=utf-8 :vi ────────────────────┘

PKGS += THIRD_PARTY_CMAKE

THIRD_PARTY_CMAKE_ARTIFACTS += THIRD_PARTY_CMAKE_A
THIRD_PARTY_CMAKE = $(THIRD_PARTY_CMAKE_A_DEPS) $(THIRD_PARTY_CMAKE_A)
THIRD_PARTY_CMAKE_A = o/$(MODE)/third_party/cmake/cmake.a
THIRD_PARTY_CMAKE_FILES := $(wildcard third_party/cmake/*)
THIRD_PARTY_CMAKE_HDRS = $(filter %.h,$(THIRD_PARTY_CMAKE_FILES))
THIRD_PARTY_CMAKE_INCS = $(filter %.inc,$(THIRD_PARTY_CMAKE_FILES))
THIRD_PARTY_CMAKE_SRCS = $(filter %.c,$(THIRD_PARTY_CMAKE_FILES))
THIRD_PARTY_CMAKE_OBJS = $(THIRD_PARTY_CMAKE_SRCS:%.c=o/$(MODE)/%.o)

#THIRD_PARTY_AWK_A_DIRECTDEPS =				\
#	LIBC_CALLS					\
#	LIBC_FMT					\
#	LIBC_INTRIN					\
#	LIBC_MEM					\
#	LIBC_NEXGEN32E					\
#	LIBC_PROC					\
#	LIBC_RUNTIME					\
#	LIBC_STDIO					\
#	LIBC_STR					\
#	LIBC_SYSTEM					\
#	LIBC_SYSV					\
#	LIBC_TINYMATH					\
#	THIRD_PARTY_GDTOA				\
#	THIRD_PARTY_MUSL				\
#	TOOL_ARGS					\

#THIRD_PARTY_AWK_A_DEPS :=				\
#	$(call uniq,$(foreach x,$(THIRD_PARTY_AWK_A_DIRECTDEPS),$($(x))))

#THIRD_PARTY_AWK_CHECKS =				\
#	$(THIRD_PARTY_AWK_A).pkg
#
#$(THIRD_PARTY_AWK_A):					\
#		third_party/awk/			\
#		$(THIRD_PARTY_AWK_A).pkg		\
#		$(THIRD_PARTY_AWK_OBJS)
#
#$(THIRD_PARTY_AWK_A).pkg:				\
#		$(THIRD_PARTY_AWK_OBJS)			\
#		$(foreach x,$(THIRD_PARTY_AWK_A_DIRECTDEPS),$($(x)_A).pkg)
#
#o/$(MODE)/third_party/awk/awk.dbg:			\
#		$(THIRD_PARTY_AWK)			\
#		o/$(MODE)/third_party/awk/cmd.o		\
#		o/$(MODE)/third_party/awk/README.zip.o	\
#		$(CRT)					\
#		$(APE_NO_MODIFY_SELF)
#	@$(APELINK)
#
#o/$(MODE)/third_party/awk/README.zip.o:			\
#		ZIPOBJ_FLAGS +=				\
#			-B
#
#$(THIRD_PARTY_AWK_OBJS): private CFLAGS += -Wno-use-after-free
#
#THIRD_PARTY_AWK_BINS = $(THIRD_PARTY_AWK_COMS) $(THIRD_PARTY_AWK_COMS:%=%.dbg)
#THIRD_PARTY_AWK_COMS = o/$(MODE)/third_party/awk/awk
#THIRD_PARTY_AWK_LIBS = $(THIRD_PARTY_AWK_A)
#$(THIRD_PARTY_AWK_OBJS): $(BUILD_FILES) third_party/awk/BUILD.mk

.PHONY: o/$(MODE)/third_party/cmake/bootstrap
o/$(MODE)/third_party/cmake/bootstrap:
	mkdir -p third_party/cmake/build/$(MODE)
	cd third_party/cmake/build/$(MODE) && 		\
	CC="$(PWD)/$(CC) -I$(PWD)/.cosmocc/current/include -L$(PWD)/.cosmoscc/current/lib" CXX="$(PWD)/$(CXX)" ../bootstrap

.PHONY: o/$(MODE)/third_party/cmake
o/$(MODE)/third_party/cmake:				\
		o/$(MODE)/third_party/cmake/bootstrap
#		$(THIRD_PARTY_AWK_BINS)			\
#		$(THIRD_PARTY_AWK_CHECKS)
