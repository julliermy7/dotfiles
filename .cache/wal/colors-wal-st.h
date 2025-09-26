const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0e1012", /* black   */
  [1] = "#A1927E", /* red     */
  [2] = "#B6A98F", /* green   */
  [3] = "#C7B99A", /* yellow  */
  [4] = "#D0C19F", /* blue    */
  [5] = "#D4C4A2", /* magenta */
  [6] = "#E3D3AE", /* cyan    */
  [7] = "#eee9d5", /* white   */

  /* 8 bright colors */
  [8]  = "#a6a395",  /* black   */
  [9]  = "#A1927E",  /* red     */
  [10] = "#B6A98F", /* green   */
  [11] = "#C7B99A", /* yellow  */
  [12] = "#D0C19F", /* blue    */
  [13] = "#D4C4A2", /* magenta */
  [14] = "#E3D3AE", /* cyan    */
  [15] = "#eee9d5", /* white   */

  /* special colors */
  [256] = "#0e1012", /* background */
  [257] = "#eee9d5", /* foreground */
  [258] = "#eee9d5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
