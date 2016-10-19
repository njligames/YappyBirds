CP=cp

OBJDIR=../../assets/scripts
SRCDIR=scripts

STRUCTURE := $(shell find $(SRCDIR) -type d)
CODEFILES := $(addsuffix /*, $(STRUCTURE))
CODEFILES := $(wildcard $(CODEFILES))

SRCFILES := $(filter %.lua, $(CODEFILES))
OBJFILES := $(subst $(SRCDIR), $(OBJDIR), $(SRCFILES:%.lua=%.lua))

OUTDIRS := $(addprefix $(OBJDIR)/../, $(STRUCTURE))

all: debug

debug: dirs compile_debug export

release: dirs compile_release export

$(OBJDIR)/%.lua: $(addprefix $(SRCDIR)/, %.lua)
	@$(CP) $^ $@

$(OUTDIRS):
	@mkdir -p $@

export: $(OBJFILES)

dirs: $(OUTDIRS)

compile_debug:
	@luac $(SRCFILES)

compile_release:
	@luac -s $(SRCFILES)

clean:
	@rm -rf $(OBJDIR)/*

echo:
	@echo "SRCFILES=$(SRCFILES)"
	@echo "OBJFILES=$(OBJFILES)"

