#
# A Makefile that compiles all .c and .s files in "src" and "res" 
# subdirectories and places the output in a "obj" subdirectory
#

# If you move this project you can change the directory 
# to match your GBDK root directory (ex: GBDK_HOME = "C:/GBDK/"
ifndef GBDK_HOME
	GBDK_HOME = /usr/local/opt/gbdk/
endif

LCC = $(GBDK_HOME)bin/lcc 

LCCFLAGS += -debug -Wl-yt0x1B -Wm-yo4 -Wm-ya4 -Wb-ext=.rel -Wm-yc


# You can set the name of the .gbc ROM file here
PROJECTNAME    = Motherlode

SRCDIR      = src
OBJDIR      = obj
ASSETDIR    = assets
BINDIR      = build
MKDIRS      = $(OBJDIR) $(BINDIR)

BINS	    = $(OBJDIR)/$(PROJECTNAME).gbc
CSOURCES    = $(foreach dir,$(SRCDIR),$(notdir $(wildcard $(dir)/*.c))) $(foreach dir,$(ASSETDIR),$(notdir $(wildcard $(dir)/*.c)))
ASMSOURCES  = $(foreach dir,$(SRCDIR),$(notdir $(wildcard $(dir)/*.s)))
OBJS       = $(CSOURCES:%.c=$(OBJDIR)/%.o)

.PHONY: png2asset
png2asset:
	/usr/local/opt/gbdk/bin/png2asset png/font.png -c assets/font.c -spr8x8 -tiles_only -no_palettes -noflip -keep_duplicate_tiles

	/usr/local/opt/gbdk/bin/png2asset png/rover.png -c assets/rover.c -spr8x8 -no_palettes -noflip -sh 16 -tile_origin 1 -b 1
	/usr/local/opt/gbdk/bin/png2asset png/drill_h.png -c assets/drill_h.c -spr8x8 -no_palettes -noflip -sh 16 -tile_origin 9 -b 1
	/usr/local/opt/gbdk/bin/png2asset png/drill_v.png -c assets/drill_v.c -spr8x8 -no_palettes -noflip -sh 8 -tile_origin 13 -b 1
	/usr/local/opt/gbdk/bin/png2asset png/prop.png -c assets/prop.c -spr8x8 -no_palettes -noflip -sh 8 -tile_origin 17 -b 1
	/usr/local/opt/gbdk/bin/png2asset png/nav.png -c assets/nav.c -spr8x8 -map -tile_origin 80 -noflip -b 1
	/usr/local/opt/gbdk/bin/png2asset png/ore_tiles.png -c assets/ore_tiles.c -spr8x8 -keep_palette_order -max_palettes 24 -noflip -b 1
	/usr/local/opt/gbdk/bin/png2asset png/progressbar.png -c assets/progressbar.c -spr8x8 -tiles_only -no_palettes -keep_duplicate_tiles -noflip -b 1
	/usr/local/opt/gbdk/bin/png2asset png/station_fuel.png -c assets/station_fuel.c -spr8x8 -map -tile_origin 128 -noflip -b 1
	/usr/local/opt/gbdk/bin/png2asset png/station_sell.png -c assets/station_sell.c -spr8x8 -map -tile_origin 151 -noflip -b 1
	/usr/local/opt/gbdk/bin/png2asset png/station_upgrade.png -c assets/station_upgrade.c -spr8x8 -map -tile_origin 187 -noflip -b 1
	/usr/local/opt/gbdk/bin/png2asset png/warning_cargo.png -c assets/warning_cargo.c -spr8x8 -tiles_only -no_palettes -noflip -keep_duplicate_tiles -tile_origin 48 -b 1
	/usr/local/opt/gbdk/bin/png2asset png/warning_fuel.png -c assets/warning_fuel.c -spr8x8 -tiles_only -no_palettes -noflip -keep_duplicate_tiles -tile_origin 55 -b 1
	/usr/local/opt/gbdk/bin/png2asset png/game_over.png -c assets/game_over.c -spr8x8 -no_palettes -noflip -tile_origin 64 -b 1
	/usr/local/opt/gbdk/bin/png2asset png/a_button.png -c assets/a_button.c -spr8x8 -no_palettes -noflip -sh 16 -tile_origin 96 -b 1

	/usr/local/opt/gbdk/bin/png2asset png/upgrade_tiles.png -c assets/upgrade_tiles.c -spr8x8 -noflip -keep_palette_order -max_palettes 36 -keep_duplicate_tiles -tile_origin 160 -b 2
	/usr/local/opt/gbdk/bin/png2asset png/shop_frame.png -c assets/shop_frame.c -spr8x8 -map -noflip -tile_origin 144 -b 2
	/usr/local/opt/gbdk/bin/png2asset png/shop_highlight_frame.png -c assets/shop_highlight_frame.c -spr8x8 -keep_duplicate_tiles -no_palettes -noflip -tiles_only -b 2

	/usr/local/opt/gbdk/bin/png2asset png/main_menu_buttons.png -c assets/main_menu_buttons.c -spr8x8 -keep_duplicate_tiles -no_palettes -noflip -b 3
	/usr/local/opt/gbdk/bin/png2asset png/splashscreen.png -c assets/splashscreen.c -spr8x8 -map -use_map_attributes -b 3

all:	clean prepare png2asset $(BINS) copy-rom

# Compile .c files in "src/" to .o object files with specific flags for bank files
$(OBJDIR)/%.o:	$(SRCDIR)/%.c
	$(eval EXTRA_FLAGS :=)
	$(if $(findstring level.ba0,$<), $(eval EXTRA_FLAGS := -Wf-ba0))
	$(if $(findstring level.ba1,$<), $(eval EXTRA_FLAGS := -Wf-ba1))
	$(LCC) $(LCCFLAGS) $(EXTRA_FLAGS) -c -o $@ $<

# Compile .c files in "res/" to .o object files
$(OBJDIR)/%.o:	$(ASSETDIR)/%.c
	$(LCC) $(LCCFLAGS) -c -o $@ $<

# Link the compiled object files into a .gb ROM file
$(BINS):	$(OBJS)
	$(LCC) $(LCCFLAGS) -o $(BINDIR)/$(PROJECTNAME).gbc $(OBJS)

prepare:
	mkdir -p $(OBJDIR)
	mkdir -p $(ASSETDIR)

clean:
	rm -f  $(OBJDIR)/*.* $(BINDIR)/*.*

copy-rom:
	cp $(BINDIR)/$(PROJECTNAME).gbc .

# create necessary directories after Makefile is parsed but before build
# info prevents the command from being pasted into the makefile
$(info $(shell mkdir -p $(MKDIRS)))
