const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0d0807", /* black   */
  [1] = "#9C1519", /* red     */
  [2] = "#91282E", /* green   */
  [3] = "#B0262C", /* yellow  */
  [4] = "#F41A1B", /* blue    */
  [5] = "#F41D22", /* magenta */
  [6] = "#D22024", /* cyan    */
  [7] = "#c19c9f", /* white   */

  /* 8 bright colors */
  [8]  = "#876d6f",  /* black   */
  [9]  = "#9C1519",  /* red     */
  [10] = "#91282E", /* green   */
  [11] = "#B0262C", /* yellow  */
  [12] = "#F41A1B", /* blue    */
  [13] = "#F41D22", /* magenta */
  [14] = "#D22024", /* cyan    */
  [15] = "#c19c9f", /* white   */

  /* special colors */
  [256] = "#0d0807", /* background */
  [257] = "#c19c9f", /* foreground */
  [258] = "#c19c9f",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
