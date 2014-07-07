Variables
========================================================
Bastiaan Quast, bquast@gmail.com
--------------------------------------------------------

Here we briefly describe the variables.

We start by loading the plm library and the data

```r
library(plm)
```

```
## Loading required package: Formula
```

```r
load('Child.Panel.Rdata')
```


```r
names(Child.Panel)
```

```
##   [1] "pid"              "wave"             "a.spen"          
##   [4] "a.spen.m"         "a.spen.w"         "best.age.yrs"    
##   [7] "best.edu"         "c.age.d"          "c.age.m"         
##  [10] "c.brcert"         "c.brhead"         "c.brheadsrc"     
##  [13] "c.brncc"          "c.brndc"          "c.brnprov"       
##  [16] "c.brplc"          "c.brpresdoc"      "c.brpresfam"     
##  [19] "c.brpresnrs"      "c.brprestrad"     "c.brwght"        
##  [22] "c.brwght.u"       "c.brwghtg"        "c.brwghtk"       
##  [25] "c.brwghtsrc"      "c.care1"          "c.care1.o"       
##  [28] "c.care2"          "c.care3"          "c.care4"         
##  [31] "c.care5"          "c.care6"          "c.carepc"        
##  [34] "c.carepid"        "c.carerel"        "c.chldagre"      
##  [37] "c.dob.dt"         "c.dob.m"          "c.dob.m.flg"     
##  [40] "c.dob.y"          "c.dobsrc"         "c.duration"      
##  [43] "c.ed07att"        "c.ed07ex"         "c.ed07paypc1"    
##  [46] "c.ed07paypc2"     "c.ed07paypc3"     "c.ed07paypid1"   
##  [49] "c.ed07paypid2"    "c.ed07paypid3"    "c.ed07payr1"     
##  [52] "c.ed07payr2"      "c.ed07payr3"      "c.ed07res"       
##  [55] "c.ed07spnbks"     "c.ed07spnfee"     "c.ed07spno"      
##  [58] "c.ed07spntrn"     "c.ed07spnuni"     "c.ed07wdexp"     
##  [61] "c.ed08att"        "c.ed08cur"        "c.ed08curex"     
##  [64] "c.ed08curgrd"     "c.ed08curlev"     "c.ed08res"       
##  [67] "c.ed09att"        "c.ed09ex"         "c.ed09lev"       
##  [70] "c.ed09pay"        "c.ed09payburs"    "c.ed09payngo"    
##  [73] "c.ed09paypid1"    "c.ed09paypid2"    "c.ed09paypid3"   
##  [76] "c.ed09paypid4"    "c.ed09paypr1"     "c.ed09paypr2"    
##  [79] "c.ed09paypr3"     "c.ed09paypr4"     "c.ed09res"       
##  [82] "c.ed09spnbks"     "c.ed09spnfee"     "c.ed09spno"      
##  [85] "c.ed09spntrn"     "c.ed09spnuni"     "c.ed09wdexp"     
##  [88] "c.ed09wdexp.o"    "c.ed10att"        "c.ed10cur"       
##  [91] "c.ed10curex"      "c.ed10curgrd"     "c.ed10curlev"    
##  [94] "c.ed10res"        "c.ed10wdexp"      "c.ed10wdexp.o"   
##  [97] "c.ed11att"        "c.ed11ex"         "c.ed11lev"       
## [100] "c.ed11pay"        "c.ed11payburs"    "c.ed11payngo"    
## [103] "c.ed11paypid1"    "c.ed11paypid2"    "c.ed11paypid3"   
## [106] "c.ed11paypid4"    "c.ed11paypr1"     "c.ed11paypr2"    
## [109] "c.ed11paypr3"     "c.ed11paypr4"     "c.ed11res"       
## [112] "c.ed11spnbks"     "c.ed11spnfee"     "c.ed11spno"      
## [115] "c.ed11spntrn"     "c.ed11spnuni"     "c.ed11wdexp"     
## [118] "c.ed12cur"        "c.ed12curex"      "c.ed12curgrd"    
## [121] "c.ed12curlev"     "c.edatt"          "c.edcmpgrd"      
## [124] "c.edcmpgrd.o"     "c.ede08wdexp"     "c.ede09wdexp"    
## [127] "c.edenrol09.o"    "c.edgrd1yr"       "c.edmssds"       
## [130] "c.ednfs"          "c.ednoenrolexp"   "c.edpre"         
## [133] "c.edrep"          "c.edrep1"         "c.edrep1.t"      
## [136] "c.edrep2"         "c.edrep2.t"       "c.edrep3"        
## [139] "c.edrep3.t"       "c.edrep4"         "c.edrep4.t"      
## [142] "c.edsizecls"      "c.edspnfee30d"    "c.edspntrn30d"   
## [145] "c.edtrn1"         "c.edtrn2"         "c.edtrn3"        
## [148] "c.edtrn4"         "c.edtrn5"         "c.edtrn7"        
## [151] "c.edtrntime"      "c.edtrntime.hrs"  "c.edtrntime.mins"
## [154] "c.fthali"         "c.fthbrthy"       "c.fthdth5"       
## [157] "c.fthdth5y"       "c.fthdtha"        "c.fthdthy"       
## [160] "c.fthedlev"       "c.fthfin"         "c.fthhh"         
## [163] "c.fthhh.pid"      "c.fthlsfin"       "c.fthlstfin"     
## [166] "c.fthsch"         "c.fthsch.o"       "c.fthsee"        
## [169] "c.fththa"         "c.fthtrt"         "c.fthtrtyn"      
## [172] "c.fthwrk.c"       "c.gen"            "c.grapp"         
## [175] "c.grapp.m"        "c.grapp.y"        "c.grappexp"      
## [178] "c.grappexp.o"     "c.grappref"       "c.grappref.o"    
## [181] "c.grapprs"        "c.grcur"          "c.grcur.m"       
## [184] "c.grcur.y"        "c.grcurecpc"      "c.grcurecpid"    
## [187] "c.grcurecr"       "c.grcurtyp"       "c.grpst"         
## [190] "c.grpststp.m"     "c.grpststp.y"     "c.grpststrt.m"   
## [193] "c.grpststrt.y"    "c.height.1"       "c.height.1.flg"  
## [196] "c.height.2"       "c.height.2.flg"   "c.height.3"      
## [199] "c.height.3.flg"   "c.hl1"            "c.hl11.o"        
## [202] "c.hl2"            "c.hl3"            "c.hl4"           
## [205] "c.hlchckup"       "c.hldoc"          "c.hlexp"         
## [208] "c.hlexp.o"        "c.hlill30"        "c.hlmedaid"      
## [211] "c.hlmedpayp"      "c.hlmedpaypid"    "c.hlmedpayr"     
## [214] "c.hlo.o"          "c.hlser"          "c.hlserbrn"      
## [217] "c.hlthcrd"        "c.hlthdes"        "c.hlvisaid"      
## [220] "c.hlvistst"       "c.intfillout"     "c.intlng1"       
## [223] "c.intlng2"        "c.intlng3"        "c.intlng4"       
## [226] "c.intlng5"        "c.intresp"        "c.intrespact"    
## [229] "c.intresphear"    "c.intresppc1"     "c.intresppc2"    
## [232] "c.intresppc3"     "c.intresppid1"    "c.intresppid2"   
## [235] "c.intresppid3"    "c.intrespque"     "c.intrv.d"       
## [238] "c.intrv.dt"       "c.intrv.m"        "c.intrv.y"       
## [241] "c.intrvend"       "c.intrvsrt"       "c.intvr.c"       
## [244] "c.intvr.imp"      "c.lng"            "c.lng.o"         
## [247] "c.lv06cc"         "c.lv06dc"         "c.lv06prov"      
## [250] "c.lv08dc"         "c.lv08prov"       "c.lv10prov"      
## [253] "c.lvbfcc"         "c.lvbfdc"         "c.lvbfprov"      
## [256] "c.lvevoth"        "c.meas.c"         "c.moveyr"        
## [259] "c.movy"           "c.mthali"         "c.mthbrthy"      
## [262] "c.mthdth5"        "c.mthdth5y"       "c.mthdtha"       
## [265] "c.mthdthy"        "c.mthedlev"       "c.mthfin"        
## [268] "c.mthhh"          "c.mthhh.pid"      "c.mthlsfin"      
## [271] "c.mthlstfin"      "c.mthsch"         "c.mthsee"        
## [274] "c.mthtrt"         "c.mthtrtyn"       "c.mthwrk.c"      
## [277] "c.mvprovy"        "c.mvsuby"         "c.mvtwny"        
## [280] "c.numid"          "c.numlv"          "c.numq1"         
## [283] "c.numq10"         "c.numq11"         "c.numq12"        
## [286] "c.numq13"         "c.numq14"         "c.numq15"        
## [289] "c.numq2"          "c.numq3"          "c.numq4"         
## [292] "c.numq5"          "c.numq6"          "c.numq7"         
## [295] "c.numq8"          "c.numq9"          "c.numtest"       
## [298] "c.outcome"        "c.parrel"         "c.pcode"         
## [301] "c.phase"          "c.popgrp"         "c.refage"        
## [304] "c.refexpl"        "c.refexpl.o"      "c.refgen"        
## [307] "c.refint"         "c.relocate"       "c.respcode"      
## [310] "c.respid"         "c.resrel"         "c.slpm"          
## [313] "c.slpw"           "c.waist.1"        "c.waist.2"       
## [316] "c.weight.1"       "c.weight.1.flg"   "c.weight.2"      
## [319] "c.weight.2.flg"   "c.weight.3"       "c.weight.3.flg"  
## [322] "c.woman"          "h.tinc"           "hhid"            
## [325] "id.spen"          "id.spen.m"        "id.spen.w"       
## [328] "man.60"           "man.60.64"        "man.65"          
## [331] "spen.d.m"         "spen.d.w"         "woman.60"        
## [334] "woman.60.64"      "woman.65"         "zbmi"            
## [337] "zhfa"             "zwfa"             "zwfh"            
## [340] "elig.men.60"
```
