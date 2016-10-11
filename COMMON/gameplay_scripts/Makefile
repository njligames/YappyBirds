CP=cp
BIN2 := ./../bin/luaBeautifier
OBJDIR=./../assets/scripts
SRCDIR=./scripts
LUACFLAGS=""

STRUCTURE := $(shell find $(SRCDIR) -type d)
CODEFILES := $(addsuffix /*, $(STRUCTURE))
CODEFILES := $(wildcard $(CODEFILES))

SRCFILES := $(filter %.lua, $(CODEFILES))
OBJFILES := $(subst $(SRCDIR), $(OBJDIR), $(SRCFILES:%.lua=%.lua))


all: debug

debug: compile_debug export

release: compile_release export

export: $(OBJFILES)

$(OBJDIR)/%.lua: $(addprefix $(SRCDIR)/, %.lua)
	@$(CP) $^ $@

compile_debug:
	luac -l $(SRCFILES) > luac.log
	mv luac.out $(OBJDIR)

compile_release:
	luac -s $(SRCFILES)
	mv luac.out $(OBJDIR)

clean:
	@rm -r $(OBJFILES)
	@rm -r $(OBJDIR)/luac.out
	@rm -r luac.log



