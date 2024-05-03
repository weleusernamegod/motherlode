#include <gb/gb.h>
#include <stdio.h>

#include "globals.h"
#include "constants.h"


void interrupt_LCD(void) {
    move_win(167, 0);
}
void interrupt_VBL_window(void) {
    move_win(WIN_X, 0);
}


void interrupt_VBL_framecounter(void) {
    frame_counter++;  // Increment the frame counter every VBlank
    if (frame_counter >= 60) frame_counter = 0;
}

void init_framecounter(void) {
    CRITICAL{
    add_VBL(interrupt_VBL_framecounter);  // Add the VBL interrupt handler
    }
}

void init_enable_lcd_interrupt(void){
    STAT_REG|=STATF_LYC;
    LYC_REG=21;
    CRITICAL{
        add_LCD(interrupt_LCD);
        add_VBL(interrupt_VBL_window);
    }
    set_interrupts(LCD_IFLAG | VBL_IFLAG);
}

void init_disable_lcd_interrupt(void) {
    CRITICAL{
        remove_LCD(interrupt_LCD);
        remove_VBL(interrupt_VBL_window);
    }

    STAT_REG = 0x00; // This sets the STAT_REG to a state where no LCD STAT interrupts are enabled
    set_interrupts(VBL_IFLAG | LCD_IFLAG);
}