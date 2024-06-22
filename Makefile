# If you move this project you can change the directory 
# to match your GBDK root directory (ex: GBDK_HOME = "C:/GBDK/"
ifndef GBDK_HOME
	GBDK_HOME = /usr/local/opt/gbdk/
endif

LCC = $(GBDK_HOME)bin/lcc

LCCFLAGS += -debug -Wl-yt0x1B -Wm-yo8 -Wm-ya4 -Wb-ext=.rel -Wm-yc
CFLAGS += -I$(ASSETDIR)

# You can set the name of the .gbc ROM file here
PROJECTNAME    = Motherlode

SRCDIR      = src
OBJDIR      = obj
ASSETDIR    = assets
BINDIR      = build
MKDIRS      = $(OBJDIR) $(BINDIR)

BINS	    = $(BINDIR)/$(PROJECTNAME).gbc
CSOURCES    = $(wildcard $(SRCDIR)/*.c)
ASSETSOURCES = $(wildcard $(ASSETDIR)/*.c)
OBJS        = $(CSOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o) $(ASSETSOURCES:$(ASSETDIR)/%.c=$(OBJDIR)/%.o)

.PHONY: all prepare png2asset copy-rom clean

all: $(BINS) copy-rom clean

# Generate asset files
png2asset:
	/usr/local/opt/gbdk/bin/png2asset png/font.png -c assets/font.c -spr8x8 -tiles_only -no_palettes -noflip -keep_duplicate_tiles
	/usr/local/opt/gbdk/bin/png2asset png/rover.png -c assets/rover.c -spr8x8 -repair_indexed_pal -keep_palette_order -noflip -tile_origin 1 -b 1
	/usr/local/opt/gbdk/bin/png2asset png/rover_eye.png -c assets/rover_eye.c -spr8x8 -repair_indexed_pal -keep_palette_order -noflip -tile_origin 0 -px 8 -py 8 -b 1
	/usr/local/opt/gbdk/bin/png2asset png/tracks.png -c assets/tracks.c -spr8x8 -repair_indexed_pal -keep_palette_order -noflip -sh 8 -tile_origin 5 -b 1
	/usr/local/opt/gbdk/bin/png2asset png/drill_h.png -c assets/drill_h.c -spr8x8 -repair_indexed_pal -keep_palette_order -noflip -sh 16 -tile_origin 11 -b 1
	/usr/local/opt/gbdk/bin/png2asset png/drill_v.png -c assets/drill_v.c -spr8x8 -repair_indexed_pal -keep_palette_order -noflip -sh 8 -tile_origin 15 -b 1
	/usr/local/opt/gbdk/bin/png2asset png/prop.png -c assets/prop.c -spr8x8 -no_palettes -noflip -sh 8 -tile_origin 19 -b 1
	/usr/local/opt/gbdk/bin/png2asset png/nav.png -c assets/nav.c -spr8x8 -map -tile_origin 80 -noflip -b 1
	/usr/local/opt/gbdk/bin/png2asset png/ore_tiles.png -c assets/ore_tiles.c -spr8x8 -tiles_only -keep_palette_order -max_palettes 24 -noflip -b 1
	/usr/local/opt/gbdk/bin/png2asset png/progressbar.png -c assets/progressbar.c -spr8x8 -tiles_only -no_palettes -keep_duplicate_tiles -noflip -b 1
	/usr/local/opt/gbdk/bin/png2asset png/station_powerup.png -c assets/station_powerup.c -spr8x8 -map -repair_indexed_pal -use_map_attributes -keep_palette_order -tile_origin 128 -noflip -b 1
	/usr/local/opt/gbdk/bin/png2asset png/station_sell.png -c assets/station_sell.c -spr8x8 -map -repair_indexed_pal -use_map_attributes -keep_palette_order -tile_origin 151 -noflip -b 1
	/usr/local/opt/gbdk/bin/png2asset png/station_upgrade.png -c assets/station_upgrade.c -spr8x8 -map -repair_indexed_pal -use_map_attributes -keep_palette_order -tile_origin 187 -noflip -b 1
	/usr/local/opt/gbdk/bin/png2asset png/warning_cargo.png -c assets/warning_cargo.c -spr8x8 -tiles_only -no_palettes -noflip -keep_duplicate_tiles -tile_origin 48 -b 1
	/usr/local/opt/gbdk/bin/png2asset png/warning_fuel.png -c assets/warning_fuel.c -spr8x8 -tiles_only -no_palettes -noflip -keep_duplicate_tiles -tile_origin 55 -b 1
	/usr/local/opt/gbdk/bin/png2asset png/game_over.png -c assets/game_over.c -spr8x8 -no_palettes -noflip -tile_origin 64 -b 1
	/usr/local/opt/gbdk/bin/png2asset png/a_button.png -c assets/a_button.c -spr8x8 -no_palettes -noflip -sh 16 -tile_origin 96 -b 1
	/usr/local/opt/gbdk/bin/png2asset png/upgrade_tiles.png -c assets/upgrade_tiles.c -spr8x8 -noflip -keep_palette_order -max_palettes 36 -keep_duplicate_tiles -tile_origin 160 -b 2
	/usr/local/opt/gbdk/bin/png2asset png/upgrade_frame.png -c assets/upgrade_frame.c -spr8x8 -map -noflip -tile_origin 144 -b 2
	/usr/local/opt/gbdk/bin/png2asset png/upgrade_highlight_frame.png -c assets/upgrade_highlight_frame.c -spr8x8 -keep_duplicate_tiles -tiles_only -no_palettes -noflip -b 2
	/usr/local/opt/gbdk/bin/png2asset png/sell_frame.png -c assets/sell_frame.c -spr8x8 -map -noflip -tile_origin 144 -b 3
	/usr/local/opt/gbdk/bin/png2asset png/powerup_frame.png -c assets/powerup_frame.c -spr8x8 -map -repair_indexed_pal -keep_palette_order -use_map_attributes -tile_origin 144 -noflip -b 3
	/usr/local/opt/gbdk/bin/png2asset png/powerup_highlight_frame.png -c assets/powerup_highlight_frame.c -spr8x8 -sh 24 -no_palettes -noflip -px -8 -py -16 -tile_origin 4 -b 3
	/usr/local/opt/gbdk/bin/png2asset png/fuel_display.png -c assets/fuel_display.c -spr8x8 -repair_indexed_pal -keep_palette_order -noflip -py 0 -b 3
	/usr/local/opt/gbdk/bin/png2asset png/main_menu_buttons.png -c assets/main_menu_buttons.c -spr8x8 -keep_duplicate_tiles -no_palettes -noflip -b 4
	/usr/local/opt/gbdk/bin/png2asset png/splashscreen.png -c assets/splashscreen.c -spr8x8 -map -use_map_attributes -b 4

# Compile .c files in "assets/" to .o object files
$(OBJDIR)/%.o: $(ASSETDIR)/%.c
	$(LCC) $(LCCFLAGS) $(CFLAGS) -c -o $@ $<

# Compile .c files in "src/" to .o object files with specific flags for bank files
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(eval EXTRA_FLAGS :=)
	$(if $(findstring level,$<), $(eval EXTRA_FLAGS := -Wf-ba0))
	$(LCC) $(LCCFLAGS) $(CFLAGS) $(EXTRA_FLAGS) -c -o $@ $<

# Link the compiled object files into a .gbc ROM file
$(BINS): $(OBJS)
	$(LCC) $(LCCFLAGS) $(CFLAGS) -o $(BINS) $(OBJS)

prepare:
	rm -rf $(OBJDIR) $(ASSETDIR) $(BINDIR)
	mkdir -p $(OBJDIR)
	mkdir -p $(ASSETDIR)
	mkdir -p $(BINDIR)

copy-rom:
	cp $(BINS) .

clean:
	rm -rf $(OBJDIR) $(BINDIR)

# create necessary directories after Makefile is parsed but before build
# info prevents the command from being pasted into the makefile
$(info $(shell mkdir -p $(MKDIRS)))