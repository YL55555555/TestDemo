//
//  Header.h
//  MVVM_RAC_Demo
//
//  Created by 123 on 2017/6/28.
//  Copyright © 2017年 000. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define YD_WeakObjectDef(obj) __weak typeof(obj) weak##obj = obj;
#define YD_StrongObjectDef(obj) __strong typeof(obj) strong##obj = obj;

#ifdef DEBUG

#define NSLog(...) NSLog(__VA_ARGS__)


#else

#define NSLog(...)

#endif

#endif /* Header_h */
