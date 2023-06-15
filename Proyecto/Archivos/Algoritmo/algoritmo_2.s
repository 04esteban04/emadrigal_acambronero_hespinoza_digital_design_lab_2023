mov  sl, #0
mov  fp, #0
mov  sb, #0
ldr  r1, [sb], #0
ldr  r2, [r1], #1
add  r3, r2, #1
str  r3, [r1], #1
add  sb, sb, #1
add  sl, sl, #1
cmp  sl, #0x100
bne  #0xc
mov  sl, #0
add  fp, fp, #1
cmp  fp, #0xff
bne  #0xc
mov  sb, #0
mov  r1, #0
mov  r2, #0
mov  r3, #0
ldr  r1, [sb], #1
add  r2, r2, r1
str  r2, [sb], #0x401
add  sb, sb, #1
cmp  sb, #0x100
bne  #0x4c
mov  sb, #0x100
movw r8, #0x101
mov  r2, #0
ldr  r1, [sb], #1
cmp  r8, r1
bgt  #0x90
sub  r1, r1, r8
add  r2, r2, #1
cmp  r8, r1
bgt  #0x90
b    #0x7c
str  r2, [sb], #0x401
add  sb, sb, #1
cmp  sb, #0, #4
bne  #0x6c
mov  sl, #0
mov  fp, #0
mov  sb, #0
ldr  r1, [sb], #0
ldr  r2, [r1], #0x801
str  r2, [sb], #2
add  sb, sb, #1
add  sl, sl, #1
cmp  sl, #0, #2
bne  #0xac
mov  sl, #0
add  fp, fp, #1
cmp  fp, #0, #2
bne  #0xac
bx   lr