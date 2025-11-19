// *****************************************
// C-MANSHIP, LISTING 1
// CHAPTER 11
// Adapted to GCC by Sporniket
// *****************************************
#include <osbind.h>
#include <gem.h>
#include <stdio.h>

#define BLACK 1
#define RED 2
#define GREEN 3
#define HOLLOW 0
#define SOLID 1
#define HAND 3
#define NORMAL 0

short int work_in[11], work_out[57];
short int contrl[12], intin[128];
short int ptsin[128], intout[128], ptsout[128];
const MFORM* mouse_form;
short int rec1[] = {106, 150, 206, 50};
short int rec2[] = {108, 148, 204, 52};
short int line1[] = {108, 84, 204, 84};
short int line2[] = {108, 116, 204, 116};
short int res, h_factor, v_factor, t_factor;
short int handle, dummy;

// forward declarations (instead of reordering functions)
void button_wait();
void do_menu();
void do_effects();
void do_height();
void do_rotate();
void draw_menu();
void draw_rec(short int rec[], short int fcolr, short int inter, short int style);
void init();
void mouse_print(short int mx, short int my);
void open_vwork();


int main() {
  appl_init();
  open_vwork();
  init();
  do_menu();
  v_clsvwk(handle);
  appl_exit();
  return 0;
}

void do_menu() {
  short int repeat, button, mx, my;
  repeat = 1;
  draw_menu();
  while (repeat) {
    button = 0;
    while (button == 0) {
      vq_mouse(handle, &button, &mx, &my);
      mouse_print(mx, my);
    }
    if (button == 1) {
      if (mx > 112 * h_factor && mx < 199 * h_factor) {
        if (my > 54 * v_factor && my < 81 * v_factor) {
          do_effects();
          draw_menu();
        } else if (my > 86 * v_factor && my < 113 * v_factor) {
          do_height();
          draw_menu();
        } else if (my > 118 * v_factor && my < 145 * v_factor) {
          do_rotate();
          draw_menu();
        }
      }
    } else if (button == 2)
      repeat = 0;
  }
}

void do_effects() {
  short int x, y, effect, b_effect, n_effect, height;
  v_hide_c(handle);
  v_clrwk(handle);
  vst_color(handle, BLACK);
  if (res == 0)
    height = 4;
  else
    height = 8;
  vst_height(handle, height, &dummy, &dummy, &dummy, &dummy);
  b_effect = 1;
  for (x = 5 * h_factor; x < 260 * h_factor; x += 62 * h_factor) {
    n_effect = 1;
    for (y = 25 * v_factor; y < 126 * v_factor; y += 25 * v_factor) {
      effect = b_effect | n_effect;
      vst_effects(handle, effect);
      v_gtext(handle, x, y, "EFFECTS");
      n_effect <<= 1;
    }
    b_effect <<= 1;
  }
  v_show_c(handle, 0);
  button_wait();
}

void do_height() {
  short int height, x, y;
  x = 0;
  y = 0;
  v_hide_c(handle);
  v_clrwk(handle);
  vst_effects(handle, 1);
  for (height = 1; height < 27; ++height) {
    x += 8;
    y += 7;
    vst_height(handle, height, &dummy, &dummy, &dummy, &dummy);
    v_gtext(handle, x * h_factor, y * v_factor, "Height");
  }
  v_show_c(handle, 0);
  button_wait();
}

void do_rotate() {
  short int angle;
  v_hide_c(handle);
  v_clrwk(handle);
  vst_height(handle, 8, &dummy, &dummy, &dummy, &dummy);
  for (angle = 0; angle < 2701; angle += 900) {
    vst_rotation(handle, angle);
    v_gtext(handle, 160 * h_factor, 96 * v_factor, "ROTATION");
  }
  vst_rotation(handle, 0);
  v_show_c(handle, 0);
  button_wait();
}

void draw_menu() {
  v_hide_c(handle);
  v_clrwk(handle);
  draw_rec(rec1, GREEN, SOLID, 0);
  draw_rec(rec2, BLACK, HOLLOW, 0);
  v_pline(handle, 2, line1);
  v_pline(handle, 2, line2);
  vst_height(handle, 10, &dummy, &dummy, &dummy, &dummy);
  vst_color(handle, RED);
  vst_effects(handle, NORMAL);
  v_gtext(handle, 110 + 152 * t_factor, 72 * v_factor, "EFFECTS");
  v_gtext(handle, 116 + 152 * t_factor, 104 * v_factor, "HEIGHT");
  v_gtext(handle, 116 + 152 * t_factor, 136 * v_factor, "ROTATE");
  v_show_c(handle, 0);
}

void draw_rec(short int rec[], short int fcolr, short int inter, short int style)
{
  short int rxc[4];
  short int x;
  for (x = 0; x < 4; ++x)
    rxc[x] = rec[x];
  vsf_color(handle, fcolr);
  vsf_interior(handle, inter);
  vsf_style(handle, style);
  v_bar(handle, rxc);
}

void open_vwork() {
  short int i;
  handle = graf_handle(&dummy, &dummy, &dummy, &dummy);
  for (i = 0; i < 10; work_in[i++] = 1)
    ;
  work_in[10] = 2;
  v_opnvwk(work_in, &handle, work_out);
}

void init() {
  short int x;
  res = Getrez();
  switch (res) {
  case 0:
    h_factor = 1;
    v_factor = 1;
    t_factor = 0;
    break;
  case 1:
    h_factor = 2;
    v_factor = 1;
    t_factor = 1;
    break;
  case 2:
    h_factor = 2;
    v_factor = 2;
    t_factor = 1;
  }
  for (x = 0; x < 4; ++x)
    if (x == 0 || x == 2) {
      rec1[x] = rec1[x] * h_factor;
      rec2[x] = rec2[x] * h_factor;
      line1[x] = line1[x] * h_factor;
      line2[x] = line2[x] * h_factor;
    } else {
      rec1[x] = rec1[x] * v_factor;
      rec2[x] = rec2[x] * v_factor;
      line1[x] = line1[x] * v_factor;
      line2[x] = line2[x] * v_factor;
    }
  graf_mouse(HAND, mouse_form);
}

void button_wait() {
  short int button, mx, my;
  button = 0;
  while (button == 0)
    vq_mouse(handle, &button, &mx, &my);
  while (button > 0)
    vq_mouse(handle, &button, &mx, &my);
}

void mouse_print(short int mx, short int my)
{
  char tx[10], ty[10];
  vst_height(handle, 6, &dummy, &dummy, &dummy, &dummy);
  sprintf(tx, "%d ", mx);
  sprintf(ty, "%d ", my);
  v_gtext(handle, 20, 30, tx);
  v_gtext(handle, 52, 30, ty);
}
