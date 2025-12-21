; ModuleID = 'benchmark_vectors.cpp'
source_filename = "benchmark_vectors.cpp"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx15.2.0"

%"class.std::__1::basic_ostream" = type { ptr, %"class.std::__1::basic_ios.base" }
%"class.std::__1::basic_ios.base" = type <{ %"class.std::__1::ios_base", ptr, i32 }>
%"class.std::__1::ios_base" = type { ptr, i32, i64, i64, i32, i32, ptr, ptr, ptr, ptr, i64, i64, ptr, i64, i64, ptr, i64, i64 }
%"class.std::__1::locale::id" = type <{ %"struct.std::__1::once_flag", i32, [4 x i8] }>
%"struct.std::__1::once_flag" = type { i64 }
%class.ConstantVector = type <{ ptr, i64, i64, i64, i64, i64, i64, i64, i64, %"class.std::__1::allocator", %"class.std::__1::allocator.0", [6 x i8] }>
%"class.std::__1::allocator" = type { i8 }
%"class.std::__1::allocator.0" = type { i8 }
%"class.std::__1::locale" = type { ptr }
%class.STLVector = type <{ ptr, i32, i32, %"class.std::__1::allocator", [7 x i8] }>
%"class.benchmark::State" = type { i64, i64, i64, i8, i8, i32, %"class.std::__1::vector.32", i64, %"class.std::__1::map", %"class.std::__1::basic_string", i32, i32, ptr, ptr, ptr }
%"class.std::__1::vector.32" = type { ptr, ptr, %"class.std::__1::__compressed_pair.33" }
%"class.std::__1::__compressed_pair.33" = type { %"struct.std::__1::__compressed_pair_elem.34" }
%"struct.std::__1::__compressed_pair_elem.34" = type { ptr }
%"class.std::__1::map" = type { %"class.std::__1::__tree" }
%"class.std::__1::__tree" = type { ptr, %"class.std::__1::__compressed_pair.39", %"class.std::__1::__compressed_pair.45" }
%"class.std::__1::__compressed_pair.39" = type { %"struct.std::__1::__compressed_pair_elem.40" }
%"struct.std::__1::__compressed_pair_elem.40" = type { %"class.std::__1::__tree_end_node" }
%"class.std::__1::__tree_end_node" = type { ptr }
%"class.std::__1::__compressed_pair.45" = type { %"struct.std::__1::__compressed_pair_elem.46" }
%"struct.std::__1::__compressed_pair_elem.46" = type { i64 }
%"class.std::__1::basic_string" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"struct.std::__1::basic_string<char>::__rep" }
%"struct.std::__1::basic_string<char>::__rep" = type { %union.anon }
%union.anon = type { %"struct.std::__1::basic_string<char>::__long" }
%"struct.std::__1::basic_string<char>::__long" = type { ptr, i64, i64 }
%"class.std::__1::basic_ostream<char>::sentry" = type { i8, ptr }
%"class.std::__1::basic_ios" = type <{ %"class.std::__1::ios_base", ptr, i32, [4 x i8] }>
%"struct.std::__1::basic_string<char>::__short" = type { [23 x i8], [0 x i8], i8 }
%"class.benchmark::internal::FunctionBenchmark" = type { %"class.benchmark::internal::Benchmark", ptr }
%"class.benchmark::internal::Benchmark" = type { ptr, %"class.std::__1::basic_string", i32, %"class.std::__1::vector", %"class.std::__1::vector.13", i32, i8, i32, double, double, i64, i32, i8, i8, i8, i32, ptr, %"class.std::__1::vector.20", %"class.std::__1::vector.27", ptr, ptr }
%"class.std::__1::vector" = type { ptr, ptr, %"class.std::__1::__compressed_pair.7" }
%"class.std::__1::__compressed_pair.7" = type { %"struct.std::__1::__compressed_pair_elem.8" }
%"struct.std::__1::__compressed_pair_elem.8" = type { ptr }
%"class.std::__1::vector.13" = type { ptr, ptr, %"class.std::__1::__compressed_pair.14" }
%"class.std::__1::__compressed_pair.14" = type { %"struct.std::__1::__compressed_pair_elem.15" }
%"struct.std::__1::__compressed_pair_elem.15" = type { ptr }
%"class.std::__1::vector.20" = type { ptr, ptr, %"class.std::__1::__compressed_pair.21" }
%"class.std::__1::__compressed_pair.21" = type { %"struct.std::__1::__compressed_pair_elem.22" }
%"struct.std::__1::__compressed_pair_elem.22" = type { ptr }
%"class.std::__1::vector.27" = type { ptr, ptr, %"class.std::__1::__compressed_pair.28" }
%"class.std::__1::__compressed_pair.28" = type { %"struct.std::__1::__compressed_pair_elem.29" }
%"struct.std::__1::__compressed_pair_elem.29" = type { ptr }

@_ZNSt3__14coutE = external global %"class.std::__1::basic_ostream", align 8
@.str = private unnamed_addr constant [61 x i8] c"ConstantVector Push Pop didn't do all push/pop elements, n: \00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c", sv size: \00", align 1
@.str.2 = private unnamed_addr constant [59 x i8] c"Stellar vector pop front didn't complete successfully, n: \00", align 1
@.str.3 = private unnamed_addr constant [41 x i8] c" Steller vector back() is not matching: \00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c", n-i-1: \00", align 1
@.str.5 = private unnamed_addr constant [59 x i8] c"Stellar vector Pop_back() and back() didn't run completely\00", align 1
@.str.6 = private unnamed_addr constant [57 x i8] c"Vector Pop didn't complete successfully in VectorPushPop\00", align 1
@.str.7 = private unnamed_addr constant [51 x i8] c"vector Pop_back() and back() didn't run completely\00", align 1
@_ZL27benchmark_uniq_2_benchmark_ = internal unnamed_addr global ptr null, align 8
@.str.9 = private unnamed_addr constant [22 x i8] c"BM_ConstantVectorPush\00", align 1
@_ZL27benchmark_uniq_3_benchmark_ = internal unnamed_addr global ptr null, align 8
@.str.11 = private unnamed_addr constant [21 x i8] c"BM_ConstantVectorPop\00", align 1
@_ZL27benchmark_uniq_4_benchmark_ = internal unnamed_addr global ptr null, align 8
@.str.13 = private unnamed_addr constant [29 x i8] c"BM_ConstantVectorPopNoShrink\00", align 1
@_ZL27benchmark_uniq_5_benchmark_ = internal unnamed_addr global ptr null, align 8
@.str.15 = private unnamed_addr constant [24 x i8] c"BM_ConstantVectorAccess\00", align 1
@_ZL27benchmark_uniq_6_benchmark_ = internal unnamed_addr global ptr null, align 8
@.str.17 = private unnamed_addr constant [27 x i8] c"BM_ConstantVectorIteration\00", align 1
@_ZL27benchmark_uniq_7_benchmark_ = internal unnamed_addr global ptr null, align 8
@.str.19 = private unnamed_addr constant [14 x i8] c"BM_VectorPush\00", align 1
@_ZL27benchmark_uniq_8_benchmark_ = internal unnamed_addr global ptr null, align 8
@.str.21 = private unnamed_addr constant [13 x i8] c"BM_VectorPop\00", align 1
@_ZL27benchmark_uniq_9_benchmark_ = internal unnamed_addr global ptr null, align 8
@.str.23 = private unnamed_addr constant [16 x i8] c"BM_VectorAccess\00", align 1
@_ZL28benchmark_uniq_10_benchmark_ = internal unnamed_addr global ptr null, align 8
@.str.25 = private unnamed_addr constant [19 x i8] c"BM_VectorIteration\00", align 1
@__const.main.arg0_default = private unnamed_addr constant [10 x i8] c"benchmark\00", align 1
@.str.26 = private unnamed_addr constant [13 x i8] c"basic_string\00", align 1
@_ZTISt12length_error = external constant ptr
@_ZTVSt12length_error = available_externally unnamed_addr constant { [5 x ptr] } { [5 x ptr] [ptr null, ptr @_ZTISt12length_error, ptr @_ZNSt12length_errorD1Ev, ptr @_ZNSt12length_errorD0Ev, ptr @_ZNKSt11logic_error4whatEv] }, align 8
@_ZTISt20bad_array_new_length = external constant ptr
@_ZTVN9benchmark8internal17FunctionBenchmarkE = external unnamed_addr constant { [5 x ptr] }, align 8
@_ZNSt3__15ctypeIcE2idE = external global %"class.std::__1::locale::id", align 8
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @_GLOBAL__sub_I_benchmark_vectors.cpp, ptr null }]

declare i32 @_ZN9benchmark8internal17InitializeStreamsEv() local_unnamed_addr #0

; Function Attrs: mustprogress ssp uwtable(sync)
define i32 @_Z18constantVectorPushR14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEEi(ptr noundef nonnull align 8 dereferenceable(74) %0, i32 noundef %1) local_unnamed_addr #1 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %10

4:                                                ; preds = %2
  %5 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 5
  %6 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 4
  %7 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 3
  %8 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 2
  %9 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 1
  br label %14

10:                                               ; preds = %39, %2
  %11 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 1
  %12 = load i64, ptr %11, align 8, !tbaa !6
  %13 = trunc i64 %12 to i32
  ret i32 %13

14:                                               ; preds = %4, %39
  %15 = phi i32 [ 0, %4 ], [ %48, %39 ]
  %16 = load i64, ptr %5, align 8, !tbaa !15
  %17 = add nsw i64 %16, 1
  store i64 %17, ptr %5, align 8, !tbaa !15
  %18 = load i64, ptr %6, align 8, !tbaa !16
  %19 = icmp eq i64 %17, %18
  %20 = load ptr, ptr %0, align 8, !tbaa !17
  br i1 %19, label %23, label %21, !prof !18

21:                                               ; preds = %14
  %22 = load i64, ptr %7, align 8, !tbaa !19
  br label %39

23:                                               ; preds = %14
  store i64 0, ptr %5, align 8, !tbaa !15
  %24 = load i64, ptr %7, align 8, !tbaa !19
  %25 = add i64 %24, 1
  store i64 %25, ptr %7, align 8, !tbaa !19
  %26 = shl i64 %17, 1
  store i64 %26, ptr %6, align 8, !tbaa !16
  %27 = getelementptr inbounds ptr, ptr %20, i64 %25
  %28 = load ptr, ptr %27, align 8, !tbaa !20
  %29 = icmp eq ptr %28, null
  br i1 %29, label %30, label %39

30:                                               ; preds = %23
  %31 = icmp ugt i64 %26, 4611686018427387903
  br i1 %31, label %32, label %33

32:                                               ; preds = %30
  tail call void @_ZSt28__throw_bad_array_new_lengthB8ne180100v() #15
  unreachable

33:                                               ; preds = %30
  %34 = shl i64 %17, 3
  %35 = tail call noalias nonnull ptr @_Znwm(i64 noundef %34) #16
  store ptr %35, ptr %27, align 8, !tbaa !20
  %36 = load i64, ptr %8, align 8, !tbaa !21
  %37 = add i64 %36, %26
  store i64 %37, ptr %8, align 8, !tbaa !21
  %38 = load ptr, ptr %0, align 8, !tbaa !17
  br label %39

39:                                               ; preds = %21, %23, %33
  %40 = phi i64 [ 0, %23 ], [ 0, %33 ], [ %17, %21 ]
  %41 = phi i64 [ %25, %23 ], [ %25, %33 ], [ %22, %21 ]
  %42 = phi ptr [ %20, %23 ], [ %38, %33 ], [ %20, %21 ]
  %43 = getelementptr inbounds ptr, ptr %42, i64 %41
  %44 = load ptr, ptr %43, align 8, !tbaa !20
  %45 = getelementptr inbounds i32, ptr %44, i64 %40
  store i32 %15, ptr %45, align 4, !tbaa !22
  %46 = load i64, ptr %9, align 8, !tbaa !6
  %47 = add i64 %46, 1
  store i64 %47, ptr %9, align 8, !tbaa !6
  tail call void asm sideeffect "", "=*r|m,*0,~{memory}"(ptr nonnull elementtype(%class.ConstantVector) %0, ptr nonnull elementtype(%class.ConstantVector) %0) #17, !srcloc !24
  %48 = add nuw nsw i32 %15, 1
  %49 = icmp eq i32 %48, %1
  br i1 %49, label %10, label %14, !llvm.loop !25
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: mustprogress ssp uwtable(sync)
define i32 @_Z21constantVectorPushPopR14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEEi(ptr nocapture noundef nonnull align 8 dereferenceable(74) %0, i32 noundef %1) local_unnamed_addr #1 personality ptr @__gxx_personality_v0 {
  %3 = alloca %"class.std::__1::locale", align 8
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %5, label %55

5:                                                ; preds = %2
  %6 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 5
  %7 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 4
  %8 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 3
  %9 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 2
  %10 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 1
  %11 = load i64, ptr %6, align 8, !tbaa !15
  %12 = load i64, ptr %7, align 8, !tbaa !16
  %13 = load i64, ptr %8, align 8, !tbaa !19
  %14 = load i64, ptr %9, align 8, !tbaa !21
  %15 = load i64, ptr %10, align 8, !tbaa !6
  %16 = load ptr, ptr %0, align 8, !tbaa !17
  br label %19

17:                                               ; preds = %43
  %18 = load i64, ptr %6, align 8, !tbaa !15
  br label %59

19:                                               ; preds = %5, %43
  %20 = phi ptr [ %16, %5 ], [ %44, %43 ]
  %21 = phi i64 [ %15, %5 ], [ %52, %43 ]
  %22 = phi i64 [ %14, %5 ], [ %45, %43 ]
  %23 = phi i64 [ %13, %5 ], [ %46, %43 ]
  %24 = phi i64 [ %12, %5 ], [ %47, %43 ]
  %25 = phi i64 [ %11, %5 ], [ %48, %43 ]
  %26 = phi i32 [ 0, %5 ], [ %53, %43 ]
  %27 = add nsw i64 %25, 1
  store i64 %27, ptr %6, align 8, !tbaa !15
  %28 = icmp eq i64 %27, %24
  br i1 %28, label %29, label %43, !prof !18

29:                                               ; preds = %19
  store i64 0, ptr %6, align 8, !tbaa !15
  %30 = add i64 %23, 1
  store i64 %30, ptr %8, align 8, !tbaa !19
  %31 = shl i64 %24, 1
  store i64 %31, ptr %7, align 8, !tbaa !16
  %32 = getelementptr inbounds ptr, ptr %20, i64 %30
  %33 = load ptr, ptr %32, align 8, !tbaa !20
  %34 = icmp eq ptr %33, null
  br i1 %34, label %35, label %43

35:                                               ; preds = %29
  %36 = icmp ugt i64 %31, 4611686018427387903
  br i1 %36, label %37, label %38

37:                                               ; preds = %35
  tail call void @_ZSt28__throw_bad_array_new_lengthB8ne180100v() #15
  unreachable

38:                                               ; preds = %35
  %39 = shl i64 %24, 3
  %40 = tail call noalias nonnull ptr @_Znwm(i64 noundef %39) #16
  store ptr %40, ptr %32, align 8, !tbaa !20
  %41 = add i64 %22, %31
  store i64 %41, ptr %9, align 8, !tbaa !21
  %42 = load ptr, ptr %0, align 8, !tbaa !17
  br label %43

43:                                               ; preds = %19, %29, %38
  %44 = phi ptr [ %20, %29 ], [ %42, %38 ], [ %20, %19 ]
  %45 = phi i64 [ %22, %29 ], [ %41, %38 ], [ %22, %19 ]
  %46 = phi i64 [ %30, %29 ], [ %30, %38 ], [ %23, %19 ]
  %47 = phi i64 [ %31, %29 ], [ %31, %38 ], [ %24, %19 ]
  %48 = phi i64 [ 0, %29 ], [ 0, %38 ], [ %27, %19 ]
  %49 = getelementptr inbounds ptr, ptr %44, i64 %46
  %50 = load ptr, ptr %49, align 8, !tbaa !20
  %51 = getelementptr inbounds i32, ptr %50, i64 %48
  store i32 %26, ptr %51, align 4, !tbaa !22
  %52 = add i64 %21, 1
  store i64 %52, ptr %10, align 8, !tbaa !6
  %53 = add nuw nsw i32 %26, 1
  %54 = icmp eq i32 %53, %1
  br i1 %54, label %17, label %19, !llvm.loop !27

55:                                               ; preds = %83, %2
  %56 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 1
  %57 = load i64, ptr %56, align 8, !tbaa !6
  %58 = icmp eq i64 %57, 0
  br i1 %58, label %112, label %87

59:                                               ; preds = %17, %83
  %60 = phi i64 [ %18, %17 ], [ %84, %83 ]
  %61 = phi i32 [ 0, %17 ], [ %85, %83 ]
  %62 = load i64, ptr %10, align 8, !tbaa !6
  %63 = add i64 %62, -1
  store i64 %63, ptr %10, align 8, !tbaa !6
  %64 = add nsw i64 %60, -1
  store i64 %64, ptr %6, align 8, !tbaa !15
  %65 = icmp slt i64 %60, 1
  br i1 %65, label %66, label %83, !prof !18

66:                                               ; preds = %59
  %67 = load i64, ptr %8, align 8, !tbaa !19
  %68 = icmp eq i64 %67, 0
  br i1 %68, label %83, label %69

69:                                               ; preds = %66
  %70 = load i64, ptr %7, align 8, !tbaa !16
  %71 = load i64, ptr %9, align 8, !tbaa !21
  %72 = sub i64 %71, %70
  store i64 %72, ptr %9, align 8, !tbaa !21
  %73 = load ptr, ptr %0, align 8, !tbaa !17
  %74 = getelementptr inbounds ptr, ptr %73, i64 %67
  %75 = load ptr, ptr %74, align 8, !tbaa !20
  tail call void @_ZdlPv(ptr noundef %75) #18
  %76 = load ptr, ptr %0, align 8, !tbaa !17
  %77 = load i64, ptr %8, align 8, !tbaa !19
  %78 = getelementptr inbounds ptr, ptr %76, i64 %77
  store ptr null, ptr %78, align 8, !tbaa !20
  %79 = add i64 %77, -1
  store i64 %79, ptr %8, align 8, !tbaa !19
  %80 = load i64, ptr %7, align 8, !tbaa !16
  %81 = lshr i64 %80, 1
  store i64 %81, ptr %7, align 8, !tbaa !16
  %82 = add nsw i64 %81, -1
  store i64 %82, ptr %6, align 8, !tbaa !15
  br label %83

83:                                               ; preds = %59, %66, %69
  %84 = phi i64 [ %64, %59 ], [ %64, %66 ], [ %82, %69 ]
  %85 = add nuw nsw i32 %61, 1
  %86 = icmp eq i32 %85, %1
  br i1 %86, label %55, label %59, !llvm.loop !28

87:                                               ; preds = %55
  %88 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef nonnull @.str, i64 noundef 60)
  %89 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr noundef nonnull %88, i32 noundef %1)
  %90 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) %89, ptr noundef nonnull @.str.1, i64 noundef 11)
  %91 = load i64, ptr %56, align 8, !tbaa !6
  %92 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEm(ptr noundef nonnull %90, i64 noundef %91)
  %93 = load ptr, ptr %92, align 8, !tbaa !29
  %94 = getelementptr i8, ptr %93, i64 -24
  %95 = load i64, ptr %94, align 8
  %96 = getelementptr inbounds i8, ptr %92, i64 %95
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #17
  call void @_ZNKSt3__18ios_base6getlocEv(ptr nonnull sret(%"class.std::__1::locale") align 8 %3, ptr noundef nonnull %96)
  %97 = invoke ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr noundef nonnull %3, ptr noundef nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %98 unwind label %103

98:                                               ; preds = %87
  %99 = load ptr, ptr %97, align 8, !tbaa !29
  %100 = getelementptr inbounds ptr, ptr %99, i64 7
  %101 = load ptr, ptr %100, align 8
  %102 = invoke signext i8 %101(ptr noundef nonnull %97, i8 noundef signext 10)
          to label %106 unwind label %103

103:                                              ; preds = %98, %87
  %104 = landingpad { ptr, i32 }
          cleanup
  %105 = call ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull %3) #17
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #17
  resume { ptr, i32 } %104

106:                                              ; preds = %98
  %107 = call ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull %3) #17
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #17
  %108 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull %92, i8 noundef signext %102)
  %109 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(ptr noundef nonnull %92)
  %110 = load i64, ptr %56, align 8, !tbaa !6
  %111 = trunc i64 %110 to i32
  br label %112

112:                                              ; preds = %106, %55
  %113 = phi i32 [ %111, %106 ], [ 0, %55 ]
  ret i32 %113
}

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr noundef, i32 noundef) local_unnamed_addr #0

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEm(ptr noundef, i64 noundef) local_unnamed_addr #0

; Function Attrs: mustprogress ssp uwtable(sync)
define i32 @_Z17constantVectorPopR14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEEi(ptr noundef nonnull align 8 dereferenceable(74) %0, i32 noundef %1) local_unnamed_addr #1 personality ptr @__gxx_personality_v0 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %10

4:                                                ; preds = %2
  %5 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 1
  %6 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 5
  %7 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 3
  %8 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 4
  %9 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 2
  br label %14

10:                                               ; preds = %38, %2
  %11 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 1
  %12 = load i64, ptr %11, align 8, !tbaa !6
  %13 = trunc i64 %12 to i32
  ret i32 %13

14:                                               ; preds = %4, %38
  %15 = phi i32 [ 0, %4 ], [ %39, %38 ]
  %16 = load i64, ptr %5, align 8, !tbaa !6
  %17 = add i64 %16, -1
  store i64 %17, ptr %5, align 8, !tbaa !6
  %18 = load i64, ptr %6, align 8, !tbaa !15
  %19 = add nsw i64 %18, -1
  store i64 %19, ptr %6, align 8, !tbaa !15
  %20 = icmp slt i64 %18, 1
  br i1 %20, label %21, label %38, !prof !18

21:                                               ; preds = %14
  %22 = load i64, ptr %7, align 8, !tbaa !19
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %38, label %24

24:                                               ; preds = %21
  %25 = load i64, ptr %8, align 8, !tbaa !16
  %26 = load i64, ptr %9, align 8, !tbaa !21
  %27 = sub i64 %26, %25
  store i64 %27, ptr %9, align 8, !tbaa !21
  %28 = load ptr, ptr %0, align 8, !tbaa !17
  %29 = getelementptr inbounds ptr, ptr %28, i64 %22
  %30 = load ptr, ptr %29, align 8, !tbaa !20
  tail call void @_ZdlPv(ptr noundef %30) #18
  %31 = load ptr, ptr %0, align 8, !tbaa !17
  %32 = load i64, ptr %7, align 8, !tbaa !19
  %33 = getelementptr inbounds ptr, ptr %31, i64 %32
  store ptr null, ptr %33, align 8, !tbaa !20
  %34 = add i64 %32, -1
  store i64 %34, ptr %7, align 8, !tbaa !19
  %35 = load i64, ptr %8, align 8, !tbaa !16
  %36 = lshr i64 %35, 1
  store i64 %36, ptr %8, align 8, !tbaa !16
  %37 = add nsw i64 %36, -1
  store i64 %37, ptr %6, align 8, !tbaa !15
  br label %38

38:                                               ; preds = %14, %21, %24
  tail call void asm sideeffect "", "=*r|m,*0,~{memory}"(ptr nonnull elementtype(%class.ConstantVector) %0, ptr nonnull elementtype(%class.ConstantVector) %0) #17, !srcloc !24
  %39 = add nuw nsw i32 %15, 1
  %40 = icmp eq i32 %39, %1
  br i1 %40, label %10, label %14, !llvm.loop !31
}

; Function Attrs: mustprogress ssp uwtable(sync)
define i32 @_Z25constantVectorPopNoShrinkR14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEEi(ptr noundef nonnull align 8 dereferenceable(74) %0, i32 noundef %1) local_unnamed_addr #1 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %9

4:                                                ; preds = %2
  %5 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 1
  %6 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 5
  %7 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 3
  %8 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 4
  br label %13

9:                                                ; preds = %28, %2
  %10 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 1
  %11 = load i64, ptr %10, align 8, !tbaa !6
  %12 = trunc i64 %11 to i32
  ret i32 %12

13:                                               ; preds = %4, %28
  %14 = phi i32 [ 0, %4 ], [ %29, %28 ]
  %15 = load i64, ptr %5, align 8, !tbaa !6
  %16 = add i64 %15, -1
  store i64 %16, ptr %5, align 8, !tbaa !6
  %17 = load i64, ptr %6, align 8, !tbaa !15
  %18 = add nsw i64 %17, -1
  store i64 %18, ptr %6, align 8, !tbaa !15
  %19 = icmp slt i64 %17, 1
  br i1 %19, label %20, label %28, !prof !18

20:                                               ; preds = %13
  %21 = load i64, ptr %7, align 8, !tbaa !19
  %22 = icmp eq i64 %21, 0
  br i1 %22, label %28, label %23

23:                                               ; preds = %20
  %24 = add i64 %21, -1
  store i64 %24, ptr %7, align 8, !tbaa !19
  %25 = load i64, ptr %8, align 8, !tbaa !16
  %26 = lshr i64 %25, 1
  store i64 %26, ptr %8, align 8, !tbaa !16
  %27 = add nsw i64 %26, -1
  store i64 %27, ptr %6, align 8, !tbaa !15
  br label %28

28:                                               ; preds = %13, %20, %23
  tail call void asm sideeffect "", "=*r|m,*0,~{memory}"(ptr nonnull elementtype(%class.ConstantVector) %0, ptr nonnull elementtype(%class.ConstantVector) %0) #17, !srcloc !24
  %29 = add nuw nsw i32 %14, 1
  %30 = icmp eq i32 %29, %1
  br i1 %30, label %9, label %13, !llvm.loop !32
}

; Function Attrs: mustprogress ssp uwtable(sync)
define i32 @_Z22constantVectorPopFrontR14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEEi(ptr nocapture noundef nonnull align 8 dereferenceable(74) %0, i32 noundef %1) local_unnamed_addr #1 personality ptr @__gxx_personality_v0 {
  %3 = alloca %"class.std::__1::locale", align 8
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %5, label %12

5:                                                ; preds = %2
  %6 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 1
  %7 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 6
  %8 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 7
  %9 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 8
  %10 = load i64, ptr %7, align 8, !tbaa !33
  %11 = load i64, ptr %9, align 8, !tbaa !34
  br label %16

12:                                               ; preds = %34, %2
  %13 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 1
  %14 = load i64, ptr %13, align 8, !tbaa !6
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %64, label %39

16:                                               ; preds = %5, %34
  %17 = phi i64 [ %11, %5 ], [ %35, %34 ]
  %18 = phi i64 [ %10, %5 ], [ %36, %34 ]
  %19 = phi i32 [ 0, %5 ], [ %37, %34 ]
  %20 = load i64, ptr %6, align 8, !tbaa !6
  %21 = add i64 %20, -1
  store i64 %21, ptr %6, align 8, !tbaa !6
  %22 = add i64 %18, 1
  store i64 %22, ptr %7, align 8, !tbaa !33
  %23 = load i64, ptr %8, align 8, !tbaa !35
  %24 = add i64 %23, 1
  store i64 %24, ptr %8, align 8, !tbaa !35
  %25 = shl i64 256, %17
  %26 = icmp eq i64 %22, %25
  br i1 %26, label %27, label %34

27:                                               ; preds = %16
  %28 = load ptr, ptr %0, align 8, !tbaa !17
  %29 = getelementptr inbounds ptr, ptr %28, i64 %17
  %30 = load ptr, ptr %29, align 8, !tbaa !20
  tail call void @_ZdlPv(ptr noundef %30) #18
  %31 = load i64, ptr %9, align 8, !tbaa !34
  %32 = add i64 %31, 1
  %33 = and i64 %32, 63
  store i64 %33, ptr %9, align 8, !tbaa !34
  store i64 0, ptr %7, align 8, !tbaa !33
  br label %34

34:                                               ; preds = %16, %27
  %35 = phi i64 [ %17, %16 ], [ %33, %27 ]
  %36 = phi i64 [ %22, %16 ], [ 0, %27 ]
  %37 = add nuw nsw i32 %19, 1
  %38 = icmp eq i32 %37, %1
  br i1 %38, label %12, label %16, !llvm.loop !36

39:                                               ; preds = %12
  %40 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef nonnull @.str.2, i64 noundef 58)
  %41 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr noundef nonnull %40, i32 noundef %1)
  %42 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) %41, ptr noundef nonnull @.str.1, i64 noundef 11)
  %43 = load i64, ptr %13, align 8, !tbaa !6
  %44 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEm(ptr noundef nonnull %42, i64 noundef %43)
  %45 = load ptr, ptr %44, align 8, !tbaa !29
  %46 = getelementptr i8, ptr %45, i64 -24
  %47 = load i64, ptr %46, align 8
  %48 = getelementptr inbounds i8, ptr %44, i64 %47
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #17
  call void @_ZNKSt3__18ios_base6getlocEv(ptr nonnull sret(%"class.std::__1::locale") align 8 %3, ptr noundef nonnull %48)
  %49 = invoke ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr noundef nonnull %3, ptr noundef nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %50 unwind label %55

50:                                               ; preds = %39
  %51 = load ptr, ptr %49, align 8, !tbaa !29
  %52 = getelementptr inbounds ptr, ptr %51, i64 7
  %53 = load ptr, ptr %52, align 8
  %54 = invoke signext i8 %53(ptr noundef nonnull %49, i8 noundef signext 10)
          to label %58 unwind label %55

55:                                               ; preds = %50, %39
  %56 = landingpad { ptr, i32 }
          cleanup
  %57 = call ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull %3) #17
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #17
  resume { ptr, i32 } %56

58:                                               ; preds = %50
  %59 = call ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull %3) #17
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #17
  %60 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull %44, i8 noundef signext %54)
  %61 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(ptr noundef nonnull %44)
  %62 = load i64, ptr %13, align 8, !tbaa !6
  %63 = trunc i64 %62 to i32
  br label %64

64:                                               ; preds = %58, %12
  %65 = phi i32 [ %63, %58 ], [ 0, %12 ]
  ret i32 %65
}

; Function Attrs: mustprogress ssp uwtable(sync)
define i32 @_Z24constantVectorPopAndBackR14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEEi(ptr nocapture noundef nonnull align 8 dereferenceable(74) %0, i32 noundef %1) local_unnamed_addr #1 personality ptr @__gxx_personality_v0 {
  %3 = alloca %"class.std::__1::locale", align 8
  %4 = alloca %"class.std::__1::locale", align 8
  %5 = icmp sgt i32 %1, 0
  br i1 %5, label %6, label %79

6:                                                ; preds = %2
  %7 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 3
  %8 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 5
  %9 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 1
  %10 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 4
  %11 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 2
  %12 = load i64, ptr %7, align 8, !tbaa !19
  %13 = load i64, ptr %8, align 8, !tbaa !15
  br label %14

14:                                               ; preds = %6, %71
  %15 = phi i64 [ %13, %6 ], [ %72, %71 ]
  %16 = phi i64 [ %12, %6 ], [ %73, %71 ]
  %17 = phi i32 [ 0, %6 ], [ %74, %71 ]
  %18 = load ptr, ptr %0, align 8, !tbaa !17
  %19 = getelementptr inbounds ptr, ptr %18, i64 %16
  %20 = load ptr, ptr %19, align 8, !tbaa !20
  %21 = getelementptr inbounds i32, ptr %20, i64 %15
  %22 = load i32, ptr %21, align 4, !tbaa !22
  %23 = xor i32 %17, -1
  %24 = add i32 %23, %1
  %25 = icmp eq i32 %22, %24
  br i1 %25, label %53, label %26

26:                                               ; preds = %14
  %27 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef nonnull @.str.3, i64 noundef 40)
  %28 = load ptr, ptr %0, align 8, !tbaa !17
  %29 = load i64, ptr %7, align 8, !tbaa !19
  %30 = getelementptr inbounds ptr, ptr %28, i64 %29
  %31 = load ptr, ptr %30, align 8, !tbaa !20
  %32 = load i64, ptr %8, align 8, !tbaa !15
  %33 = getelementptr inbounds i32, ptr %31, i64 %32
  %34 = load i32, ptr %33, align 4, !tbaa !22
  %35 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr noundef nonnull %27, i32 noundef %34)
  %36 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) %35, ptr noundef nonnull @.str.4, i64 noundef 9)
  %37 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr noundef nonnull %36, i32 noundef %24)
  %38 = load ptr, ptr %37, align 8, !tbaa !29
  %39 = getelementptr i8, ptr %38, i64 -24
  %40 = load i64, ptr %39, align 8
  %41 = getelementptr inbounds i8, ptr %37, i64 %40
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #17
  call void @_ZNKSt3__18ios_base6getlocEv(ptr nonnull sret(%"class.std::__1::locale") align 8 %4, ptr noundef nonnull %41)
  %42 = invoke ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr noundef nonnull %4, ptr noundef nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %43 unwind label %50

43:                                               ; preds = %26
  %44 = load ptr, ptr %42, align 8, !tbaa !29
  %45 = getelementptr inbounds ptr, ptr %44, i64 7
  %46 = load ptr, ptr %45, align 8
  %47 = invoke signext i8 %46(ptr noundef nonnull %42, i8 noundef signext 10)
          to label %76 unwind label %50

48:                                               ; preds = %95, %50
  %49 = phi { ptr, i32 } [ %51, %50 ], [ %96, %95 ]
  resume { ptr, i32 } %49

50:                                               ; preds = %43, %26
  %51 = landingpad { ptr, i32 }
          cleanup
  %52 = call ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull %4) #17
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #17
  br label %48

53:                                               ; preds = %14
  %54 = load i64, ptr %9, align 8, !tbaa !6
  %55 = add i64 %54, -1
  store i64 %55, ptr %9, align 8, !tbaa !6
  %56 = add nsw i64 %15, -1
  store i64 %56, ptr %8, align 8, !tbaa !15
  %57 = icmp slt i64 %15, 1
  br i1 %57, label %58, label %71, !prof !18

58:                                               ; preds = %53
  %59 = icmp eq i64 %16, 0
  br i1 %59, label %71, label %60

60:                                               ; preds = %58
  %61 = load i64, ptr %10, align 8, !tbaa !16
  %62 = load i64, ptr %11, align 8, !tbaa !21
  %63 = sub i64 %62, %61
  store i64 %63, ptr %11, align 8, !tbaa !21
  tail call void @_ZdlPv(ptr noundef nonnull %20) #18
  %64 = load ptr, ptr %0, align 8, !tbaa !17
  %65 = load i64, ptr %7, align 8, !tbaa !19
  %66 = getelementptr inbounds ptr, ptr %64, i64 %65
  store ptr null, ptr %66, align 8, !tbaa !20
  %67 = add i64 %65, -1
  store i64 %67, ptr %7, align 8, !tbaa !19
  %68 = load i64, ptr %10, align 8, !tbaa !16
  %69 = lshr i64 %68, 1
  store i64 %69, ptr %10, align 8, !tbaa !16
  %70 = add nsw i64 %69, -1
  store i64 %70, ptr %8, align 8, !tbaa !15
  br label %71

71:                                               ; preds = %53, %58, %60
  %72 = phi i64 [ %56, %53 ], [ %56, %58 ], [ %70, %60 ]
  %73 = phi i64 [ %16, %53 ], [ 0, %58 ], [ %67, %60 ]
  %74 = add nuw nsw i32 %17, 1
  %75 = icmp eq i32 %74, %1
  br i1 %75, label %79, label %14, !llvm.loop !37

76:                                               ; preds = %43
  %77 = call ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull %4) #17
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #17
  %78 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull %37, i8 noundef signext %47)
  br label %101

79:                                               ; preds = %71, %2
  %80 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 1
  %81 = load i64, ptr %80, align 8, !tbaa !6
  %82 = icmp eq i64 %81, 0
  br i1 %82, label %105, label %83

83:                                               ; preds = %79
  %84 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef nonnull @.str.5, i64 noundef 58)
  %85 = load ptr, ptr %84, align 8, !tbaa !29
  %86 = getelementptr i8, ptr %85, i64 -24
  %87 = load i64, ptr %86, align 8
  %88 = getelementptr inbounds i8, ptr %84, i64 %87
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #17
  call void @_ZNKSt3__18ios_base6getlocEv(ptr nonnull sret(%"class.std::__1::locale") align 8 %3, ptr noundef nonnull %88)
  %89 = invoke ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr noundef nonnull %3, ptr noundef nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %90 unwind label %95

90:                                               ; preds = %83
  %91 = load ptr, ptr %89, align 8, !tbaa !29
  %92 = getelementptr inbounds ptr, ptr %91, i64 7
  %93 = load ptr, ptr %92, align 8
  %94 = invoke signext i8 %93(ptr noundef nonnull %89, i8 noundef signext 10)
          to label %98 unwind label %95

95:                                               ; preds = %90, %83
  %96 = landingpad { ptr, i32 }
          cleanup
  %97 = call ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull %3) #17
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #17
  br label %48

98:                                               ; preds = %90
  %99 = call ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull %3) #17
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #17
  %100 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull %84, i8 noundef signext %94)
  br label %101

101:                                              ; preds = %76, %98
  %102 = phi ptr [ %84, %98 ], [ %37, %76 ]
  %103 = phi ptr [ %80, %98 ], [ %9, %76 ]
  %104 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(ptr noundef nonnull %102)
  br label %105

105:                                              ; preds = %101, %79
  %106 = phi ptr [ %80, %79 ], [ %103, %101 ]
  %107 = load i64, ptr %106, align 8, !tbaa !6
  %108 = trunc i64 %107 to i32
  ret i32 %108
}

; Function Attrs: mustprogress ssp uwtable(sync)
define i64 @_Z27constantVectorElementAccessR14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEEi(ptr nocapture noundef nonnull readonly align 8 dereferenceable(74) %0, i32 noundef %1) local_unnamed_addr #1 {
  %3 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #17
  store i64 0, ptr %3, align 8, !tbaa !38
  %4 = sext i32 %1 to i64
  %5 = icmp eq i32 %1, 0
  br i1 %5, label %8, label %10

6:                                                ; preds = %10
  %7 = load i64, ptr %3, align 8, !tbaa !38
  br label %8

8:                                                ; preds = %6, %2
  %9 = phi i64 [ %7, %6 ], [ 0, %2 ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #17
  ret i64 %9

10:                                               ; preds = %2, %10
  %11 = phi i64 [ %28, %10 ], [ 0, %2 ]
  %12 = trunc i64 %11 to i32
  %13 = add i32 %12, 256
  %14 = call i32 @llvm.ctlz.i32(i32 %13, i1 false), !range !39
  %15 = sub nsw i32 23, %14
  %16 = load ptr, ptr %0, align 8, !tbaa !17
  %17 = zext i32 %15 to i64
  %18 = getelementptr inbounds ptr, ptr %16, i64 %17
  %19 = load ptr, ptr %18, align 8, !tbaa !20
  %20 = zext i32 %13 to i64
  %21 = shl i64 -256, %17
  %22 = add i64 %21, %20
  %23 = getelementptr inbounds i32, ptr %19, i64 %22
  %24 = load i32, ptr %23, align 4, !tbaa !22
  %25 = sext i32 %24 to i64
  %26 = load i64, ptr %3, align 8, !tbaa !38
  %27 = add nsw i64 %26, %25
  store i64 %27, ptr %3, align 8, !tbaa !38
  call void asm sideeffect "", "=*r|m,0,~{memory}"(ptr nonnull elementtype(i64) %3, i64 %27) #17, !srcloc !24
  %28 = add nuw i64 %11, 1
  %29 = icmp eq i64 %28, %4
  br i1 %29, label %6, label %10, !llvm.loop !40
}

; Function Attrs: ssp uwtable(sync)
define i64 @_Z17constantVectorSumR14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEE(ptr nocapture noundef nonnull readonly align 8 dereferenceable(74) %0) local_unnamed_addr #3 {
  %2 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #17
  store i64 0, ptr %2, align 8, !tbaa !38
  %3 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 1
  %4 = load i64, ptr %3, align 8, !tbaa !6, !noalias !41
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %31, label %6

6:                                                ; preds = %1
  %7 = load ptr, ptr %0, align 8, !tbaa !17, !noalias !41
  %8 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 8
  %9 = load i64, ptr %8, align 8, !tbaa !34, !noalias !42
  %10 = getelementptr inbounds ptr, ptr %7, i64 %9
  %11 = load ptr, ptr %10, align 8, !tbaa !20, !noalias !42
  %12 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 6
  %13 = load i64, ptr %12, align 8, !tbaa !33, !noalias !42
  %14 = shl i64 %13, 32
  %15 = ashr exact i64 %14, 32
  %16 = getelementptr inbounds i32, ptr %11, i64 %15
  %17 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 3
  %18 = load i64, ptr %17, align 8, !tbaa !19, !noalias !45
  %19 = getelementptr inbounds ptr, ptr %7, i64 %18
  %20 = load ptr, ptr %19, align 8, !tbaa !20, !noalias !45
  %21 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 5
  %22 = load i64, ptr %21, align 8, !tbaa !15, !noalias !45
  %23 = getelementptr inbounds i32, ptr %20, i64 %22
  %24 = getelementptr inbounds i32, ptr %23, i64 1
  %25 = icmp eq ptr %16, %24
  br i1 %25, label %31, label %26

26:                                               ; preds = %6
  %27 = shl i64 256, %9
  %28 = getelementptr inbounds i32, ptr %11, i64 %27
  br label %33

29:                                               ; preds = %52
  %30 = load i64, ptr %2, align 8, !tbaa !38
  br label %31

31:                                               ; preds = %1, %29, %6
  %32 = phi i64 [ %30, %29 ], [ 0, %6 ], [ 0, %1 ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #17
  ret i64 %32

33:                                               ; preds = %26, %52
  %34 = phi ptr [ %55, %52 ], [ %28, %26 ]
  %35 = phi ptr [ %54, %52 ], [ %16, %26 ]
  %36 = phi ptr [ %53, %52 ], [ %10, %26 ]
  %37 = load i32, ptr %35, align 4, !tbaa !22
  %38 = sext i32 %37 to i64
  %39 = load i64, ptr %2, align 8, !tbaa !38
  %40 = add nsw i64 %39, %38
  store i64 %40, ptr %2, align 8, !tbaa !38
  call void asm sideeffect "", "=*r|m,0,~{memory}"(ptr nonnull elementtype(i64) %2, i64 %40) #17, !srcloc !24
  %41 = getelementptr inbounds i32, ptr %35, i64 1
  %42 = icmp eq ptr %41, %34
  br i1 %42, label %43, label %52, !prof !18

43:                                               ; preds = %33
  %44 = getelementptr inbounds ptr, ptr %36, i64 1
  %45 = load ptr, ptr %44, align 8, !tbaa !20
  %46 = load ptr, ptr %36, align 8, !tbaa !20
  %47 = ptrtoint ptr %34 to i64
  %48 = ptrtoint ptr %46 to i64
  %49 = sub i64 %47, %48
  %50 = ashr exact i64 %49, 1
  %51 = getelementptr inbounds i32, ptr %45, i64 %50
  br label %52

52:                                               ; preds = %33, %43
  %53 = phi ptr [ %44, %43 ], [ %36, %33 ]
  %54 = phi ptr [ %45, %43 ], [ %41, %33 ]
  %55 = phi ptr [ %51, %43 ], [ %34, %33 ]
  %56 = icmp eq ptr %54, %24
  br i1 %56, label %29, label %33
}

; Function Attrs: mustprogress ssp uwtable(sync)
define i32 @_Z10vectorPushR9STLVectorIiNSt3__19allocatorIiEEEi(ptr noundef nonnull align 8 dereferenceable(17) %0, i32 noundef %1) local_unnamed_addr #1 personality ptr @__gxx_personality_v0 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %7

4:                                                ; preds = %2
  %5 = getelementptr inbounds %class.STLVector, ptr %0, i64 0, i32 1
  %6 = getelementptr inbounds %class.STLVector, ptr %0, i64 0, i32 2
  br label %10

7:                                                ; preds = %66, %2
  %8 = getelementptr inbounds %class.STLVector, ptr %0, i64 0, i32 1
  %9 = load i32, ptr %8, align 8, !tbaa !48
  ret i32 %9

10:                                               ; preds = %4, %66
  %11 = phi i32 [ 0, %4 ], [ %72, %66 ]
  %12 = load i32, ptr %5, align 8, !tbaa !48
  %13 = load i32, ptr %6, align 4, !tbaa !50
  %14 = icmp eq i32 %12, %13
  br i1 %14, label %17, label %15, !prof !18

15:                                               ; preds = %10
  %16 = load ptr, ptr %0, align 8, !tbaa !51
  br label %66

17:                                               ; preds = %10
  %18 = shl nsw i32 %12, 1
  store i32 %18, ptr %6, align 4, !tbaa !50
  %19 = icmp slt i32 %12, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  tail call void @_ZSt28__throw_bad_array_new_lengthB8ne180100v() #15
  unreachable

21:                                               ; preds = %17
  %22 = sext i32 %18 to i64
  %23 = shl nuw nsw i64 %22, 2
  %24 = tail call noalias nonnull ptr @_Znwm(i64 noundef %23) #16
  %25 = icmp eq i32 %12, 0
  %26 = load ptr, ptr %0, align 8, !tbaa !51
  br i1 %25, label %57, label %27

27:                                               ; preds = %21
  %28 = ptrtoint ptr %26 to i64
  %29 = ptrtoint ptr %24 to i64
  %30 = zext i32 %12 to i64
  %31 = icmp ult i32 %12, 16
  %32 = sub i64 %29, %28
  %33 = icmp ult i64 %32, 64
  %34 = select i1 %31, i1 true, i1 %33
  br i1 %34, label %55, label %35

35:                                               ; preds = %27
  %36 = and i64 %30, 4294967280
  br label %37

37:                                               ; preds = %37, %35
  %38 = phi i64 [ 0, %35 ], [ %51, %37 ]
  %39 = getelementptr inbounds i32, ptr %26, i64 %38
  %40 = load <4 x i32>, ptr %39, align 4, !tbaa !22
  %41 = getelementptr inbounds i32, ptr %39, i64 4
  %42 = load <4 x i32>, ptr %41, align 4, !tbaa !22
  %43 = getelementptr inbounds i32, ptr %39, i64 8
  %44 = load <4 x i32>, ptr %43, align 4, !tbaa !22
  %45 = getelementptr inbounds i32, ptr %39, i64 12
  %46 = load <4 x i32>, ptr %45, align 4, !tbaa !22
  %47 = getelementptr inbounds i32, ptr %24, i64 %38
  store <4 x i32> %40, ptr %47, align 4, !tbaa !22
  %48 = getelementptr inbounds i32, ptr %47, i64 4
  store <4 x i32> %42, ptr %48, align 4, !tbaa !22
  %49 = getelementptr inbounds i32, ptr %47, i64 8
  store <4 x i32> %44, ptr %49, align 4, !tbaa !22
  %50 = getelementptr inbounds i32, ptr %47, i64 12
  store <4 x i32> %46, ptr %50, align 4, !tbaa !22
  %51 = add nuw i64 %38, 16
  %52 = icmp eq i64 %51, %36
  br i1 %52, label %53, label %37, !llvm.loop !52

53:                                               ; preds = %37
  %54 = icmp eq i64 %36, %30
  br i1 %54, label %57, label %55

55:                                               ; preds = %27, %53
  %56 = phi i64 [ 0, %27 ], [ %36, %53 ]
  br label %59

57:                                               ; preds = %59, %53, %21
  tail call void @_ZdlPv(ptr noundef %26) #18
  store ptr %24, ptr %0, align 8, !tbaa !51
  %58 = load i32, ptr %5, align 8, !tbaa !48
  br label %66

59:                                               ; preds = %55, %59
  %60 = phi i64 [ %64, %59 ], [ %56, %55 ]
  %61 = getelementptr inbounds i32, ptr %26, i64 %60
  %62 = load i32, ptr %61, align 4, !tbaa !22
  %63 = getelementptr inbounds i32, ptr %24, i64 %60
  store i32 %62, ptr %63, align 4, !tbaa !22
  %64 = add nuw nsw i64 %60, 1
  %65 = icmp eq i64 %64, %30
  br i1 %65, label %57, label %59, !llvm.loop !55

66:                                               ; preds = %15, %57
  %67 = phi i32 [ %12, %15 ], [ %58, %57 ]
  %68 = phi ptr [ %16, %15 ], [ %24, %57 ]
  %69 = add nsw i32 %67, 1
  store i32 %69, ptr %5, align 8, !tbaa !48
  %70 = sext i32 %67 to i64
  %71 = getelementptr inbounds i32, ptr %68, i64 %70
  store i32 %11, ptr %71, align 4, !tbaa !22
  tail call void asm sideeffect "", "=*r|m,*0,~{memory}"(ptr nonnull elementtype(%class.STLVector) %0, ptr nonnull elementtype(%class.STLVector) %0) #17, !srcloc !24
  %72 = add nuw nsw i32 %11, 1
  %73 = icmp eq i32 %72, %1
  br i1 %73, label %7, label %10, !llvm.loop !56
}

; Function Attrs: mustprogress ssp uwtable(sync)
define i64 @_Z19vectorElementAccessR9STLVectorIiNSt3__19allocatorIiEEEi(ptr nocapture noundef nonnull readonly align 8 dereferenceable(17) %0, i32 noundef %1) local_unnamed_addr #1 {
  %3 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #17
  store i64 0, ptr %3, align 8, !tbaa !38
  %4 = sext i32 %1 to i64
  %5 = icmp eq i32 %1, 0
  br i1 %5, label %8, label %10

6:                                                ; preds = %10
  %7 = load i64, ptr %3, align 8, !tbaa !38
  br label %8

8:                                                ; preds = %6, %2
  %9 = phi i64 [ %7, %6 ], [ 0, %2 ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #17
  ret i64 %9

10:                                               ; preds = %2, %10
  %11 = phi i64 [ %18, %10 ], [ 0, %2 ]
  %12 = load ptr, ptr %0, align 8, !tbaa !51
  %13 = getelementptr inbounds i32, ptr %12, i64 %11
  %14 = load i32, ptr %13, align 4, !tbaa !22
  %15 = sext i32 %14 to i64
  %16 = load i64, ptr %3, align 8, !tbaa !38
  %17 = add nsw i64 %16, %15
  store i64 %17, ptr %3, align 8, !tbaa !38
  call void asm sideeffect "", "=*r|m,0,~{memory}"(ptr nonnull elementtype(i64) %3, i64 %17) #17, !srcloc !24
  %18 = add nuw i64 %11, 1
  %19 = icmp eq i64 %18, %4
  br i1 %19, label %6, label %10, !llvm.loop !57
}

; Function Attrs: mustprogress ssp uwtable(sync)
define i32 @_Z13vectorPushPopR9STLVectorIiNSt3__19allocatorIiEEEi(ptr nocapture noundef nonnull align 8 dereferenceable(17) %0, i32 noundef %1) local_unnamed_addr #1 personality ptr @__gxx_personality_v0 {
  %3 = alloca %"class.std::__1::locale", align 8
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %5, label %72

5:                                                ; preds = %2
  %6 = getelementptr inbounds %class.STLVector, ptr %0, i64 0, i32 1
  %7 = getelementptr inbounds %class.STLVector, ptr %0, i64 0, i32 2
  br label %8

8:                                                ; preds = %5, %64
  %9 = phi i32 [ 0, %5 ], [ %70, %64 ]
  %10 = load i32, ptr %6, align 8, !tbaa !48
  %11 = load i32, ptr %7, align 4, !tbaa !50
  %12 = icmp eq i32 %10, %11
  br i1 %12, label %15, label %13, !prof !18

13:                                               ; preds = %8
  %14 = load ptr, ptr %0, align 8, !tbaa !51
  br label %64

15:                                               ; preds = %8
  %16 = shl nsw i32 %10, 1
  store i32 %16, ptr %7, align 4, !tbaa !50
  %17 = icmp slt i32 %10, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  tail call void @_ZSt28__throw_bad_array_new_lengthB8ne180100v() #15
  unreachable

19:                                               ; preds = %15
  %20 = sext i32 %16 to i64
  %21 = shl nuw nsw i64 %20, 2
  %22 = tail call noalias nonnull ptr @_Znwm(i64 noundef %21) #16
  %23 = icmp eq i32 %10, 0
  %24 = load ptr, ptr %0, align 8, !tbaa !51
  br i1 %23, label %55, label %25

25:                                               ; preds = %19
  %26 = ptrtoint ptr %24 to i64
  %27 = ptrtoint ptr %22 to i64
  %28 = zext i32 %10 to i64
  %29 = icmp ult i32 %10, 16
  %30 = sub i64 %27, %26
  %31 = icmp ult i64 %30, 64
  %32 = select i1 %29, i1 true, i1 %31
  br i1 %32, label %53, label %33

33:                                               ; preds = %25
  %34 = and i64 %28, 4294967280
  br label %35

35:                                               ; preds = %35, %33
  %36 = phi i64 [ 0, %33 ], [ %49, %35 ]
  %37 = getelementptr inbounds i32, ptr %24, i64 %36
  %38 = load <4 x i32>, ptr %37, align 4, !tbaa !22
  %39 = getelementptr inbounds i32, ptr %37, i64 4
  %40 = load <4 x i32>, ptr %39, align 4, !tbaa !22
  %41 = getelementptr inbounds i32, ptr %37, i64 8
  %42 = load <4 x i32>, ptr %41, align 4, !tbaa !22
  %43 = getelementptr inbounds i32, ptr %37, i64 12
  %44 = load <4 x i32>, ptr %43, align 4, !tbaa !22
  %45 = getelementptr inbounds i32, ptr %22, i64 %36
  store <4 x i32> %38, ptr %45, align 4, !tbaa !22
  %46 = getelementptr inbounds i32, ptr %45, i64 4
  store <4 x i32> %40, ptr %46, align 4, !tbaa !22
  %47 = getelementptr inbounds i32, ptr %45, i64 8
  store <4 x i32> %42, ptr %47, align 4, !tbaa !22
  %48 = getelementptr inbounds i32, ptr %45, i64 12
  store <4 x i32> %44, ptr %48, align 4, !tbaa !22
  %49 = add nuw i64 %36, 16
  %50 = icmp eq i64 %49, %34
  br i1 %50, label %51, label %35, !llvm.loop !58

51:                                               ; preds = %35
  %52 = icmp eq i64 %34, %28
  br i1 %52, label %55, label %53

53:                                               ; preds = %25, %51
  %54 = phi i64 [ 0, %25 ], [ %34, %51 ]
  br label %57

55:                                               ; preds = %57, %51, %19
  tail call void @_ZdlPv(ptr noundef %24) #18
  store ptr %22, ptr %0, align 8, !tbaa !51
  %56 = load i32, ptr %6, align 8, !tbaa !48
  br label %64

57:                                               ; preds = %53, %57
  %58 = phi i64 [ %62, %57 ], [ %54, %53 ]
  %59 = getelementptr inbounds i32, ptr %24, i64 %58
  %60 = load i32, ptr %59, align 4, !tbaa !22
  %61 = getelementptr inbounds i32, ptr %22, i64 %58
  store i32 %60, ptr %61, align 4, !tbaa !22
  %62 = add nuw nsw i64 %58, 1
  %63 = icmp eq i64 %62, %28
  br i1 %63, label %55, label %57, !llvm.loop !59

64:                                               ; preds = %13, %55
  %65 = phi i32 [ %10, %13 ], [ %56, %55 ]
  %66 = phi ptr [ %14, %13 ], [ %22, %55 ]
  %67 = add nsw i32 %65, 1
  store i32 %67, ptr %6, align 8, !tbaa !48
  %68 = sext i32 %65 to i64
  %69 = getelementptr inbounds i32, ptr %66, i64 %68
  store i32 %9, ptr %69, align 4, !tbaa !22
  %70 = add nuw nsw i32 %9, 1
  %71 = icmp eq i32 %70, %1
  br i1 %71, label %76, label %8, !llvm.loop !60

72:                                               ; preds = %130, %2
  %73 = getelementptr inbounds %class.STLVector, ptr %0, i64 0, i32 1
  %74 = load i32, ptr %73, align 8, !tbaa !48
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %153, label %133

76:                                               ; preds = %64, %130
  %77 = phi i32 [ %131, %130 ], [ 0, %64 ]
  %78 = load i32, ptr %6, align 8, !tbaa !48
  %79 = add nsw i32 %78, -1
  store i32 %79, ptr %6, align 8, !tbaa !48
  %80 = load i32, ptr %7, align 4, !tbaa !50
  %81 = sdiv i32 %80, 2
  %82 = icmp sgt i32 %79, %81
  br i1 %82, label %130, label %83, !prof !61

83:                                               ; preds = %76
  store i32 %81, ptr %7, align 4, !tbaa !50
  %84 = icmp slt i32 %80, -1
  br i1 %84, label %85, label %86

85:                                               ; preds = %83
  tail call void @_ZSt28__throw_bad_array_new_lengthB8ne180100v() #15
  unreachable

86:                                               ; preds = %83
  %87 = sext i32 %81 to i64
  %88 = shl nuw nsw i64 %87, 2
  %89 = tail call noalias nonnull ptr @_Znwm(i64 noundef %88) #16
  %90 = icmp sgt i32 %78, 1
  %91 = load ptr, ptr %0, align 8, !tbaa !51
  br i1 %90, label %92, label %122

92:                                               ; preds = %86
  %93 = ptrtoint ptr %91 to i64
  %94 = ptrtoint ptr %89 to i64
  %95 = zext i32 %79 to i64
  %96 = icmp ult i32 %78, 17
  %97 = sub i64 %94, %93
  %98 = icmp ult i64 %97, 64
  %99 = select i1 %96, i1 true, i1 %98
  br i1 %99, label %120, label %100

100:                                              ; preds = %92
  %101 = and i64 %95, 4294967280
  br label %102

102:                                              ; preds = %102, %100
  %103 = phi i64 [ 0, %100 ], [ %116, %102 ]
  %104 = getelementptr inbounds i32, ptr %91, i64 %103
  %105 = load <4 x i32>, ptr %104, align 4, !tbaa !22
  %106 = getelementptr inbounds i32, ptr %104, i64 4
  %107 = load <4 x i32>, ptr %106, align 4, !tbaa !22
  %108 = getelementptr inbounds i32, ptr %104, i64 8
  %109 = load <4 x i32>, ptr %108, align 4, !tbaa !22
  %110 = getelementptr inbounds i32, ptr %104, i64 12
  %111 = load <4 x i32>, ptr %110, align 4, !tbaa !22
  %112 = getelementptr inbounds i32, ptr %89, i64 %103
  store <4 x i32> %105, ptr %112, align 4, !tbaa !22
  %113 = getelementptr inbounds i32, ptr %112, i64 4
  store <4 x i32> %107, ptr %113, align 4, !tbaa !22
  %114 = getelementptr inbounds i32, ptr %112, i64 8
  store <4 x i32> %109, ptr %114, align 4, !tbaa !22
  %115 = getelementptr inbounds i32, ptr %112, i64 12
  store <4 x i32> %111, ptr %115, align 4, !tbaa !22
  %116 = add nuw i64 %103, 16
  %117 = icmp eq i64 %116, %101
  br i1 %117, label %118, label %102, !llvm.loop !62

118:                                              ; preds = %102
  %119 = icmp eq i64 %101, %95
  br i1 %119, label %122, label %120

120:                                              ; preds = %92, %118
  %121 = phi i64 [ 0, %92 ], [ %101, %118 ]
  br label %123

122:                                              ; preds = %123, %118, %86
  tail call void @_ZdlPv(ptr noundef %91) #18
  store ptr %89, ptr %0, align 8, !tbaa !51
  br label %130

123:                                              ; preds = %120, %123
  %124 = phi i64 [ %128, %123 ], [ %121, %120 ]
  %125 = getelementptr inbounds i32, ptr %91, i64 %124
  %126 = load i32, ptr %125, align 4, !tbaa !22
  %127 = getelementptr inbounds i32, ptr %89, i64 %124
  store i32 %126, ptr %127, align 4, !tbaa !22
  %128 = add nuw nsw i64 %124, 1
  %129 = icmp eq i64 %128, %95
  br i1 %129, label %122, label %123, !llvm.loop !63

130:                                              ; preds = %76, %122
  %131 = add nuw nsw i32 %77, 1
  %132 = icmp eq i32 %131, %1
  br i1 %132, label %72, label %76, !llvm.loop !64

133:                                              ; preds = %72
  %134 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef nonnull @.str.6, i64 noundef 56)
  %135 = load ptr, ptr %134, align 8, !tbaa !29
  %136 = getelementptr i8, ptr %135, i64 -24
  %137 = load i64, ptr %136, align 8
  %138 = getelementptr inbounds i8, ptr %134, i64 %137
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #17
  call void @_ZNKSt3__18ios_base6getlocEv(ptr nonnull sret(%"class.std::__1::locale") align 8 %3, ptr noundef nonnull %138)
  %139 = invoke ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr noundef nonnull %3, ptr noundef nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %140 unwind label %145

140:                                              ; preds = %133
  %141 = load ptr, ptr %139, align 8, !tbaa !29
  %142 = getelementptr inbounds ptr, ptr %141, i64 7
  %143 = load ptr, ptr %142, align 8
  %144 = invoke signext i8 %143(ptr noundef nonnull %139, i8 noundef signext 10)
          to label %148 unwind label %145

145:                                              ; preds = %140, %133
  %146 = landingpad { ptr, i32 }
          cleanup
  %147 = call ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull %3) #17
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #17
  resume { ptr, i32 } %146

148:                                              ; preds = %140
  %149 = call ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull %3) #17
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #17
  %150 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull %134, i8 noundef signext %144)
  %151 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(ptr noundef nonnull %134)
  %152 = load i32, ptr %73, align 8, !tbaa !48
  br label %153

153:                                              ; preds = %148, %72
  %154 = phi i32 [ %152, %148 ], [ 0, %72 ]
  ret i32 %154
}

; Function Attrs: mustprogress ssp uwtable(sync)
define i32 @_Z9vectorPopR9STLVectorIiNSt3__19allocatorIiEEEi(ptr noundef nonnull align 8 dereferenceable(17) %0, i32 noundef %1) local_unnamed_addr #1 personality ptr @__gxx_personality_v0 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %7

4:                                                ; preds = %2
  %5 = getelementptr inbounds %class.STLVector, ptr %0, i64 0, i32 1
  %6 = getelementptr inbounds %class.STLVector, ptr %0, i64 0, i32 2
  br label %10

7:                                                ; preds = %64, %2
  %8 = getelementptr inbounds %class.STLVector, ptr %0, i64 0, i32 1
  %9 = load i32, ptr %8, align 8, !tbaa !48
  ret i32 %9

10:                                               ; preds = %4, %64
  %11 = phi i32 [ 0, %4 ], [ %65, %64 ]
  %12 = load i32, ptr %5, align 8, !tbaa !48
  %13 = add nsw i32 %12, -1
  store i32 %13, ptr %5, align 8, !tbaa !48
  %14 = load i32, ptr %6, align 4, !tbaa !50
  %15 = sdiv i32 %14, 2
  %16 = icmp sgt i32 %13, %15
  br i1 %16, label %64, label %17, !prof !61

17:                                               ; preds = %10
  store i32 %15, ptr %6, align 4, !tbaa !50
  %18 = icmp slt i32 %14, -1
  br i1 %18, label %19, label %20

19:                                               ; preds = %17
  tail call void @_ZSt28__throw_bad_array_new_lengthB8ne180100v() #15
  unreachable

20:                                               ; preds = %17
  %21 = sext i32 %15 to i64
  %22 = shl nuw nsw i64 %21, 2
  %23 = tail call noalias nonnull ptr @_Znwm(i64 noundef %22) #16
  %24 = icmp sgt i32 %12, 1
  %25 = load ptr, ptr %0, align 8, !tbaa !51
  br i1 %24, label %26, label %56

26:                                               ; preds = %20
  %27 = ptrtoint ptr %25 to i64
  %28 = ptrtoint ptr %23 to i64
  %29 = zext i32 %13 to i64
  %30 = icmp ult i32 %12, 17
  %31 = sub i64 %28, %27
  %32 = icmp ult i64 %31, 64
  %33 = select i1 %30, i1 true, i1 %32
  br i1 %33, label %54, label %34

34:                                               ; preds = %26
  %35 = and i64 %29, 4294967280
  br label %36

36:                                               ; preds = %36, %34
  %37 = phi i64 [ 0, %34 ], [ %50, %36 ]
  %38 = getelementptr inbounds i32, ptr %25, i64 %37
  %39 = load <4 x i32>, ptr %38, align 4, !tbaa !22
  %40 = getelementptr inbounds i32, ptr %38, i64 4
  %41 = load <4 x i32>, ptr %40, align 4, !tbaa !22
  %42 = getelementptr inbounds i32, ptr %38, i64 8
  %43 = load <4 x i32>, ptr %42, align 4, !tbaa !22
  %44 = getelementptr inbounds i32, ptr %38, i64 12
  %45 = load <4 x i32>, ptr %44, align 4, !tbaa !22
  %46 = getelementptr inbounds i32, ptr %23, i64 %37
  store <4 x i32> %39, ptr %46, align 4, !tbaa !22
  %47 = getelementptr inbounds i32, ptr %46, i64 4
  store <4 x i32> %41, ptr %47, align 4, !tbaa !22
  %48 = getelementptr inbounds i32, ptr %46, i64 8
  store <4 x i32> %43, ptr %48, align 4, !tbaa !22
  %49 = getelementptr inbounds i32, ptr %46, i64 12
  store <4 x i32> %45, ptr %49, align 4, !tbaa !22
  %50 = add nuw i64 %37, 16
  %51 = icmp eq i64 %50, %35
  br i1 %51, label %52, label %36, !llvm.loop !65

52:                                               ; preds = %36
  %53 = icmp eq i64 %35, %29
  br i1 %53, label %56, label %54

54:                                               ; preds = %26, %52
  %55 = phi i64 [ 0, %26 ], [ %35, %52 ]
  br label %57

56:                                               ; preds = %57, %52, %20
  tail call void @_ZdlPv(ptr noundef %25) #18
  store ptr %23, ptr %0, align 8, !tbaa !51
  br label %64

57:                                               ; preds = %54, %57
  %58 = phi i64 [ %62, %57 ], [ %55, %54 ]
  %59 = getelementptr inbounds i32, ptr %25, i64 %58
  %60 = load i32, ptr %59, align 4, !tbaa !22
  %61 = getelementptr inbounds i32, ptr %23, i64 %58
  store i32 %60, ptr %61, align 4, !tbaa !22
  %62 = add nuw nsw i64 %58, 1
  %63 = icmp eq i64 %62, %29
  br i1 %63, label %56, label %57, !llvm.loop !66

64:                                               ; preds = %10, %56
  tail call void asm sideeffect "", "=*r|m,*0,~{memory}"(ptr nonnull elementtype(%class.STLVector) %0, ptr nonnull elementtype(%class.STLVector) %0) #17, !srcloc !24
  %65 = add nuw nsw i32 %11, 1
  %66 = icmp eq i32 %65, %1
  br i1 %66, label %7, label %10, !llvm.loop !67
}

; Function Attrs: mustprogress ssp uwtable(sync)
define i32 @_Z16vectorPopAndBackR9STLVectorIiNSt3__19allocatorIiEEEi(ptr nocapture noundef nonnull align 8 dereferenceable(17) %0, i32 noundef %1) local_unnamed_addr #1 personality ptr @__gxx_personality_v0 {
  %3 = alloca %"class.std::__1::locale", align 8
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %5, label %74

5:                                                ; preds = %2
  %6 = getelementptr inbounds %class.STLVector, ptr %0, i64 0, i32 1
  %7 = getelementptr inbounds %class.STLVector, ptr %0, i64 0, i32 2
  %8 = load ptr, ptr %0, align 8, !tbaa !51
  br label %9

9:                                                ; preds = %5, %70
  %10 = phi ptr [ %8, %5 ], [ %71, %70 ]
  %11 = phi i32 [ 0, %5 ], [ %72, %70 ]
  %12 = ptrtoint ptr %10 to i64
  %13 = load i32, ptr %6, align 8, !tbaa !48
  %14 = add nsw i32 %13, -1
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, ptr %10, i64 %15
  %17 = load i32, ptr %16, align 4, !tbaa !22
  %18 = xor i32 %11, -1
  %19 = add i32 %18, %1
  %20 = icmp eq i32 %17, %19
  br i1 %20, label %21, label %98

21:                                               ; preds = %9
  store i32 %14, ptr %6, align 8, !tbaa !48
  %22 = load i32, ptr %7, align 4, !tbaa !50
  %23 = sdiv i32 %22, 2
  %24 = icmp sgt i32 %14, %23
  br i1 %24, label %70, label %25, !prof !61

25:                                               ; preds = %21
  store i32 %23, ptr %7, align 4, !tbaa !50
  %26 = icmp slt i32 %22, -1
  br i1 %26, label %27, label %28

27:                                               ; preds = %25
  tail call void @_ZSt28__throw_bad_array_new_lengthB8ne180100v() #15
  unreachable

28:                                               ; preds = %25
  %29 = sext i32 %23 to i64
  %30 = shl nuw nsw i64 %29, 2
  %31 = tail call noalias nonnull ptr @_Znwm(i64 noundef %30) #16
  %32 = icmp sgt i32 %13, 1
  br i1 %32, label %33, label %62

33:                                               ; preds = %28
  %34 = ptrtoint ptr %31 to i64
  %35 = zext i32 %14 to i64
  %36 = icmp ult i32 %13, 17
  %37 = sub i64 %34, %12
  %38 = icmp ult i64 %37, 64
  %39 = select i1 %36, i1 true, i1 %38
  br i1 %39, label %60, label %40

40:                                               ; preds = %33
  %41 = and i64 %35, 4294967280
  br label %42

42:                                               ; preds = %42, %40
  %43 = phi i64 [ 0, %40 ], [ %56, %42 ]
  %44 = getelementptr inbounds i32, ptr %10, i64 %43
  %45 = load <4 x i32>, ptr %44, align 4, !tbaa !22
  %46 = getelementptr inbounds i32, ptr %44, i64 4
  %47 = load <4 x i32>, ptr %46, align 4, !tbaa !22
  %48 = getelementptr inbounds i32, ptr %44, i64 8
  %49 = load <4 x i32>, ptr %48, align 4, !tbaa !22
  %50 = getelementptr inbounds i32, ptr %44, i64 12
  %51 = load <4 x i32>, ptr %50, align 4, !tbaa !22
  %52 = getelementptr inbounds i32, ptr %31, i64 %43
  store <4 x i32> %45, ptr %52, align 4, !tbaa !22
  %53 = getelementptr inbounds i32, ptr %52, i64 4
  store <4 x i32> %47, ptr %53, align 4, !tbaa !22
  %54 = getelementptr inbounds i32, ptr %52, i64 8
  store <4 x i32> %49, ptr %54, align 4, !tbaa !22
  %55 = getelementptr inbounds i32, ptr %52, i64 12
  store <4 x i32> %51, ptr %55, align 4, !tbaa !22
  %56 = add nuw i64 %43, 16
  %57 = icmp eq i64 %56, %41
  br i1 %57, label %58, label %42, !llvm.loop !68

58:                                               ; preds = %42
  %59 = icmp eq i64 %41, %35
  br i1 %59, label %62, label %60

60:                                               ; preds = %33, %58
  %61 = phi i64 [ 0, %33 ], [ %41, %58 ]
  br label %63

62:                                               ; preds = %63, %58, %28
  tail call void @_ZdlPv(ptr noundef nonnull %10) #18
  store ptr %31, ptr %0, align 8, !tbaa !51
  br label %70

63:                                               ; preds = %60, %63
  %64 = phi i64 [ %68, %63 ], [ %61, %60 ]
  %65 = getelementptr inbounds i32, ptr %10, i64 %64
  %66 = load i32, ptr %65, align 4, !tbaa !22
  %67 = getelementptr inbounds i32, ptr %31, i64 %64
  store i32 %66, ptr %67, align 4, !tbaa !22
  %68 = add nuw nsw i64 %64, 1
  %69 = icmp eq i64 %68, %35
  br i1 %69, label %62, label %63, !llvm.loop !69

70:                                               ; preds = %21, %62
  %71 = phi ptr [ %10, %21 ], [ %31, %62 ]
  %72 = add nuw nsw i32 %11, 1
  %73 = icmp eq i32 %72, %1
  br i1 %73, label %74, label %9, !llvm.loop !70

74:                                               ; preds = %70, %2
  %75 = getelementptr inbounds %class.STLVector, ptr %0, i64 0, i32 1
  %76 = load i32, ptr %75, align 8, !tbaa !48
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %98, label %78

78:                                               ; preds = %74
  %79 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef nonnull @.str.7, i64 noundef 50)
  %80 = load ptr, ptr %79, align 8, !tbaa !29
  %81 = getelementptr i8, ptr %80, i64 -24
  %82 = load i64, ptr %81, align 8
  %83 = getelementptr inbounds i8, ptr %79, i64 %82
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #17
  call void @_ZNKSt3__18ios_base6getlocEv(ptr nonnull sret(%"class.std::__1::locale") align 8 %3, ptr noundef nonnull %83)
  %84 = invoke ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr noundef nonnull %3, ptr noundef nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %85 unwind label %90

85:                                               ; preds = %78
  %86 = load ptr, ptr %84, align 8, !tbaa !29
  %87 = getelementptr inbounds ptr, ptr %86, i64 7
  %88 = load ptr, ptr %87, align 8
  %89 = invoke signext i8 %88(ptr noundef nonnull %84, i8 noundef signext 10)
          to label %93 unwind label %90

90:                                               ; preds = %85, %78
  %91 = landingpad { ptr, i32 }
          cleanup
  %92 = call ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull %3) #17
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #17
  resume { ptr, i32 } %91

93:                                               ; preds = %85
  %94 = call ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull %3) #17
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #17
  %95 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull %79, i8 noundef signext %89)
  %96 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(ptr noundef nonnull %79)
  %97 = load i32, ptr %75, align 8, !tbaa !48
  br label %98

98:                                               ; preds = %9, %74, %93
  %99 = phi i32 [ %97, %93 ], [ 0, %74 ], [ %13, %9 ]
  ret i32 %99
}

; Function Attrs: ssp uwtable(sync)
define i64 @_Z9vectorSumR9STLVectorIiNSt3__19allocatorIiEEE(ptr nocapture noundef nonnull readonly align 8 dereferenceable(17) %0) local_unnamed_addr #3 {
  %2 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #17
  store i64 0, ptr %2, align 8, !tbaa !38
  %3 = load ptr, ptr %0, align 8, !tbaa !51
  %4 = getelementptr inbounds %class.STLVector, ptr %0, i64 0, i32 1
  %5 = load i32, ptr %4, align 8, !tbaa !48
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i32, ptr %3, i64 %6
  %8 = icmp eq i32 %5, 0
  br i1 %8, label %11, label %13

9:                                                ; preds = %13
  %10 = load i64, ptr %2, align 8, !tbaa !38
  br label %11

11:                                               ; preds = %9, %1
  %12 = phi i64 [ %10, %9 ], [ 0, %1 ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #17
  ret i64 %12

13:                                               ; preds = %1, %13
  %14 = phi ptr [ %19, %13 ], [ %3, %1 ]
  %15 = load i32, ptr %14, align 4, !tbaa !22
  %16 = sext i32 %15 to i64
  %17 = load i64, ptr %2, align 8, !tbaa !38
  %18 = add nsw i64 %17, %16
  store i64 %18, ptr %2, align 8, !tbaa !38
  call void asm sideeffect "", "=*r|m,0,~{memory}"(ptr nonnull elementtype(i64) %2, i64 %18) #17, !srcloc !24
  %19 = getelementptr inbounds i32, ptr %14, i64 1
  %20 = icmp eq ptr %19, %7
  br i1 %20, label %9, label %13
}

declare ptr @_ZN9benchmark8internal25RegisterBenchmarkInternalEPNS0_9BenchmarkE(ptr noundef) local_unnamed_addr #0

; Function Attrs: nobuiltin allocsize(0)
declare nonnull ptr @_Znwm(i64 noundef) local_unnamed_addr #4

declare i32 @__gxx_personality_v0(...)

; Function Attrs: ssp uwtable(sync)
define internal void @_ZL21BM_ConstantVectorPushRN9benchmark5StateE(ptr noundef nonnull align 8 dereferenceable(144) %0) #3 personality ptr @__gxx_personality_v0 {
  %2 = alloca %class.ConstantVector, align 8
  %3 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 5
  %4 = load i32, ptr %3, align 4, !tbaa !71
  %5 = icmp ne i32 %4, 0
  %6 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 2
  %7 = load i64, ptr %6, align 8
  tail call void @_ZN9benchmark5State16StartKeepRunningEv(ptr noundef nonnull %0)
  %8 = icmp eq i64 %7, 0
  %9 = select i1 %5, i1 true, i1 %8
  br i1 %9, label %19, label %10, !prof !18

10:                                               ; preds = %1
  %11 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 1
  %12 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 2
  %13 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 3
  %14 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 4
  %15 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 5
  %16 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 7
  %17 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 8
  %18 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 6
  br label %20

19:                                               ; preds = %86, %1
  call void @_ZN9benchmark5State17FinishKeepRunningEv(ptr noundef nonnull %0)
  ret void

20:                                               ; preds = %10, %86
  %21 = phi i64 [ %7, %10 ], [ %88, %86 ]
  call void @llvm.lifetime.start.p0(i64 80, ptr nonnull %2) #17
  store <2 x i64> <i64 0, i64 256>, ptr %11, align 8, !tbaa !89
  store <2 x i64> <i64 0, i64 256>, ptr %13, align 8, !tbaa !89
  store <2 x i64> <i64 -1, i64 0>, ptr %15, align 8, !tbaa !90
  store <2 x i64> <i64 256, i64 0>, ptr %16, align 8, !tbaa !89
  %22 = call noalias nonnull dereferenceable(512) ptr @_Znwm(i64 noundef 512) #16
  store ptr %22, ptr %2, align 8, !tbaa !17
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(512) %22, i8 0, i64 512, i1 false), !tbaa !20
  %23 = call noalias nonnull dereferenceable(1024) ptr @_Znwm(i64 noundef 1024) #16
  store ptr %23, ptr %22, align 8, !tbaa !20
  %24 = load ptr, ptr %18, align 8, !tbaa !91
  %25 = load i64, ptr %24, align 8, !tbaa !38
  %26 = trunc i64 %25 to i32
  %27 = icmp sgt i32 %26, 0
  br i1 %27, label %28, label %70

28:                                               ; preds = %20, %55
  %29 = phi i32 [ %64, %55 ], [ 0, %20 ]
  %30 = load i64, ptr %15, align 8, !tbaa !15
  %31 = add nsw i64 %30, 1
  store i64 %31, ptr %15, align 8, !tbaa !15
  %32 = load i64, ptr %14, align 8, !tbaa !16
  %33 = icmp eq i64 %31, %32
  %34 = load ptr, ptr %2, align 8, !tbaa !17
  br i1 %33, label %37, label %35, !prof !18

35:                                               ; preds = %28
  %36 = load i64, ptr %13, align 8, !tbaa !19
  br label %55

37:                                               ; preds = %28
  store i64 0, ptr %15, align 8, !tbaa !15
  %38 = load i64, ptr %13, align 8, !tbaa !19
  %39 = add i64 %38, 1
  store i64 %39, ptr %13, align 8, !tbaa !19
  %40 = shl i64 %31, 1
  store i64 %40, ptr %14, align 8, !tbaa !16
  %41 = getelementptr inbounds ptr, ptr %34, i64 %39
  %42 = load ptr, ptr %41, align 8, !tbaa !20
  %43 = icmp eq ptr %42, null
  br i1 %43, label %44, label %55

44:                                               ; preds = %37
  %45 = icmp ugt i64 %40, 4611686018427387903
  br i1 %45, label %46, label %48

46:                                               ; preds = %44
  invoke void @_ZSt28__throw_bad_array_new_lengthB8ne180100v() #15
          to label %47 unwind label %92

47:                                               ; preds = %46
  unreachable

48:                                               ; preds = %44
  %49 = shl i64 %31, 3
  %50 = invoke noalias nonnull ptr @_Znwm(i64 noundef %49) #16
          to label %51 unwind label %90

51:                                               ; preds = %48
  store ptr %50, ptr %41, align 8, !tbaa !20
  %52 = load i64, ptr %12, align 8, !tbaa !21
  %53 = add i64 %52, %40
  store i64 %53, ptr %12, align 8, !tbaa !21
  %54 = load ptr, ptr %2, align 8, !tbaa !17
  br label %55

55:                                               ; preds = %51, %37, %35
  %56 = phi i64 [ 0, %37 ], [ 0, %51 ], [ %31, %35 ]
  %57 = phi i64 [ %39, %37 ], [ %39, %51 ], [ %36, %35 ]
  %58 = phi ptr [ %34, %37 ], [ %54, %51 ], [ %34, %35 ]
  %59 = getelementptr inbounds ptr, ptr %58, i64 %57
  %60 = load ptr, ptr %59, align 8, !tbaa !20
  %61 = getelementptr inbounds i32, ptr %60, i64 %56
  store i32 %29, ptr %61, align 4, !tbaa !22
  %62 = load i64, ptr %11, align 8, !tbaa !6
  %63 = add i64 %62, 1
  store i64 %63, ptr %11, align 8, !tbaa !6
  call void asm sideeffect "", "=*r|m,*0,~{memory}"(ptr nonnull elementtype(%class.ConstantVector) %2, ptr nonnull elementtype(%class.ConstantVector) %2) #17, !srcloc !24
  %64 = add nuw nsw i32 %29, 1
  %65 = icmp eq i32 %64, %26
  br i1 %65, label %66, label %28, !llvm.loop !25

66:                                               ; preds = %55
  %67 = load i64, ptr %17, align 8, !tbaa !34
  %68 = load i64, ptr %13, align 8, !tbaa !19
  %69 = icmp ugt i64 %67, %68
  br i1 %69, label %86, label %70

70:                                               ; preds = %20, %66
  %71 = phi i64 [ 0, %20 ], [ %68, %66 ]
  %72 = phi i64 [ 0, %20 ], [ %67, %66 ]
  br label %73

73:                                               ; preds = %70, %82
  %74 = phi i64 [ %83, %82 ], [ %71, %70 ]
  %75 = phi i64 [ %84, %82 ], [ %72, %70 ]
  %76 = load ptr, ptr %2, align 8, !tbaa !17
  %77 = getelementptr inbounds ptr, ptr %76, i64 %75
  %78 = load ptr, ptr %77, align 8, !tbaa !20
  %79 = icmp eq ptr %78, null
  br i1 %79, label %82, label %80

80:                                               ; preds = %73
  call void @_ZdlPv(ptr noundef nonnull %78) #18
  %81 = load i64, ptr %13, align 8, !tbaa !19
  br label %82

82:                                               ; preds = %80, %73
  %83 = phi i64 [ %74, %73 ], [ %81, %80 ]
  %84 = add i64 %75, 1
  %85 = icmp ugt i64 %84, %83
  br i1 %85, label %86, label %73, !llvm.loop !92

86:                                               ; preds = %82, %66
  %87 = load ptr, ptr %2, align 8, !tbaa !17
  call void @_ZdlPv(ptr noundef %87) #18
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %2) #17
  %88 = add nsw i64 %21, -1
  %89 = icmp eq i64 %88, 0
  br i1 %89, label %19, label %20, !prof !18

90:                                               ; preds = %48
  %91 = landingpad { ptr, i32 }
          cleanup
  br label %94

92:                                               ; preds = %46
  %93 = landingpad { ptr, i32 }
          cleanup
  br label %94

94:                                               ; preds = %92, %90
  %95 = phi { ptr, i32 } [ %91, %90 ], [ %93, %92 ]
  %96 = call ptr @_ZN14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEED1Ev(ptr noundef nonnull %2) #17
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %2) #17
  resume { ptr, i32 } %95
}

declare ptr @_ZN9benchmark8internal9Benchmark10IterationsEx(ptr noundef, i64 noundef) local_unnamed_addr #0

declare ptr @_ZN9benchmark8internal9Benchmark15RangeMultiplierEi(ptr noundef, i32 noundef) local_unnamed_addr #0

declare ptr @_ZN9benchmark8internal9Benchmark5RangeExx(ptr noundef, i64 noundef, i64 noundef) local_unnamed_addr #0

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(ptr noundef) local_unnamed_addr #5

; Function Attrs: ssp uwtable(sync)
define internal void @_ZL20BM_ConstantVectorPopRN9benchmark5StateE(ptr noundef nonnull align 8 dereferenceable(144) %0) #3 personality ptr @__gxx_personality_v0 {
  %2 = alloca %class.ConstantVector, align 8
  %3 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 5
  %4 = load i32, ptr %3, align 4, !tbaa !71
  %5 = icmp ne i32 %4, 0
  %6 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 2
  %7 = load i64, ptr %6, align 8
  tail call void @_ZN9benchmark5State16StartKeepRunningEv(ptr noundef nonnull %0)
  %8 = icmp eq i64 %7, 0
  %9 = select i1 %5, i1 true, i1 %8
  br i1 %9, label %19, label %10, !prof !18

10:                                               ; preds = %1
  %11 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 1
  %12 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 2
  %13 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 3
  %14 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 4
  %15 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 5
  %16 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 7
  %17 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 8
  %18 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 6
  br label %20

19:                                               ; preds = %116, %1
  call void @_ZN9benchmark5State17FinishKeepRunningEv(ptr noundef nonnull %0)
  ret void

20:                                               ; preds = %10, %116
  %21 = phi i64 [ %7, %10 ], [ %118, %116 ]
  call void @_ZN9benchmark5State11PauseTimingEv(ptr noundef nonnull %0)
  call void @llvm.lifetime.start.p0(i64 80, ptr nonnull %2) #17
  store <2 x i64> <i64 0, i64 256>, ptr %11, align 8, !tbaa !89
  store <2 x i64> <i64 0, i64 256>, ptr %13, align 8, !tbaa !89
  store <2 x i64> <i64 -1, i64 0>, ptr %15, align 8, !tbaa !90
  store <2 x i64> <i64 256, i64 0>, ptr %16, align 8, !tbaa !89
  %22 = call noalias nonnull dereferenceable(512) ptr @_Znwm(i64 noundef 512) #16
  store ptr %22, ptr %2, align 8, !tbaa !17
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(512) %22, i8 0, i64 512, i1 false), !tbaa !20
  %23 = call noalias nonnull dereferenceable(1024) ptr @_Znwm(i64 noundef 1024) #16
  store ptr %23, ptr %22, align 8, !tbaa !20
  %24 = load ptr, ptr %18, align 8, !tbaa !91
  %25 = load i64, ptr %24, align 8, !tbaa !38
  %26 = trunc i64 %25 to i32
  %27 = icmp sgt i32 %26, 0
  br i1 %27, label %28, label %66

28:                                               ; preds = %20, %55
  %29 = phi i32 [ %64, %55 ], [ 0, %20 ]
  %30 = load i64, ptr %15, align 8, !tbaa !15
  %31 = add nsw i64 %30, 1
  store i64 %31, ptr %15, align 8, !tbaa !15
  %32 = load i64, ptr %14, align 8, !tbaa !16
  %33 = icmp eq i64 %31, %32
  %34 = load ptr, ptr %2, align 8, !tbaa !17
  br i1 %33, label %37, label %35, !prof !18

35:                                               ; preds = %28
  %36 = load i64, ptr %13, align 8, !tbaa !19
  br label %55

37:                                               ; preds = %28
  store i64 0, ptr %15, align 8, !tbaa !15
  %38 = load i64, ptr %13, align 8, !tbaa !19
  %39 = add i64 %38, 1
  store i64 %39, ptr %13, align 8, !tbaa !19
  %40 = shl i64 %31, 1
  store i64 %40, ptr %14, align 8, !tbaa !16
  %41 = getelementptr inbounds ptr, ptr %34, i64 %39
  %42 = load ptr, ptr %41, align 8, !tbaa !20
  %43 = icmp eq ptr %42, null
  br i1 %43, label %44, label %55

44:                                               ; preds = %37
  %45 = icmp ugt i64 %40, 4611686018427387903
  br i1 %45, label %46, label %48

46:                                               ; preds = %44
  invoke void @_ZSt28__throw_bad_array_new_lengthB8ne180100v() #15
          to label %47 unwind label %124

47:                                               ; preds = %46
  unreachable

48:                                               ; preds = %44
  %49 = shl i64 %31, 3
  %50 = invoke noalias nonnull ptr @_Znwm(i64 noundef %49) #16
          to label %51 unwind label %120

51:                                               ; preds = %48
  store ptr %50, ptr %41, align 8, !tbaa !20
  %52 = load i64, ptr %12, align 8, !tbaa !21
  %53 = add i64 %52, %40
  store i64 %53, ptr %12, align 8, !tbaa !21
  %54 = load ptr, ptr %2, align 8, !tbaa !17
  br label %55

55:                                               ; preds = %51, %37, %35
  %56 = phi i64 [ 0, %37 ], [ 0, %51 ], [ %31, %35 ]
  %57 = phi i64 [ %39, %37 ], [ %39, %51 ], [ %36, %35 ]
  %58 = phi ptr [ %34, %37 ], [ %54, %51 ], [ %34, %35 ]
  %59 = getelementptr inbounds ptr, ptr %58, i64 %57
  %60 = load ptr, ptr %59, align 8, !tbaa !20
  %61 = getelementptr inbounds i32, ptr %60, i64 %56
  store i32 %29, ptr %61, align 4, !tbaa !22
  %62 = load i64, ptr %11, align 8, !tbaa !6
  %63 = add i64 %62, 1
  store i64 %63, ptr %11, align 8, !tbaa !6
  call void asm sideeffect "", "=*r|m,*0,~{memory}"(ptr nonnull elementtype(%class.ConstantVector) %2, ptr nonnull elementtype(%class.ConstantVector) %2) #17, !srcloc !24
  %64 = add nuw nsw i32 %29, 1
  %65 = icmp eq i32 %64, %26
  br i1 %65, label %66, label %28, !llvm.loop !25

66:                                               ; preds = %55, %20
  invoke void @_ZN9benchmark5State12ResumeTimingEv(ptr noundef nonnull %0)
          to label %67 unwind label %122

67:                                               ; preds = %66
  %68 = load ptr, ptr %18, align 8, !tbaa !91
  %69 = load i64, ptr %68, align 8, !tbaa !38
  %70 = trunc i64 %69 to i32
  %71 = icmp sgt i32 %70, 0
  br i1 %71, label %72, label %99

72:                                               ; preds = %67, %96
  %73 = phi i32 [ %97, %96 ], [ 0, %67 ]
  %74 = load i64, ptr %11, align 8, !tbaa !6
  %75 = add i64 %74, -1
  store i64 %75, ptr %11, align 8, !tbaa !6
  %76 = load i64, ptr %15, align 8, !tbaa !15
  %77 = add nsw i64 %76, -1
  store i64 %77, ptr %15, align 8, !tbaa !15
  %78 = icmp slt i64 %76, 1
  br i1 %78, label %79, label %96, !prof !18

79:                                               ; preds = %72
  %80 = load i64, ptr %13, align 8, !tbaa !19
  %81 = icmp eq i64 %80, 0
  br i1 %81, label %96, label %82

82:                                               ; preds = %79
  %83 = load i64, ptr %14, align 8, !tbaa !16
  %84 = load i64, ptr %12, align 8, !tbaa !21
  %85 = sub i64 %84, %83
  store i64 %85, ptr %12, align 8, !tbaa !21
  %86 = load ptr, ptr %2, align 8, !tbaa !17
  %87 = getelementptr inbounds ptr, ptr %86, i64 %80
  %88 = load ptr, ptr %87, align 8, !tbaa !20
  call void @_ZdlPv(ptr noundef %88) #18
  %89 = load ptr, ptr %2, align 8, !tbaa !17
  %90 = load i64, ptr %13, align 8, !tbaa !19
  %91 = getelementptr inbounds ptr, ptr %89, i64 %90
  store ptr null, ptr %91, align 8, !tbaa !20
  %92 = add i64 %90, -1
  store i64 %92, ptr %13, align 8, !tbaa !19
  %93 = load i64, ptr %14, align 8, !tbaa !16
  %94 = lshr i64 %93, 1
  store i64 %94, ptr %14, align 8, !tbaa !16
  %95 = add nsw i64 %94, -1
  store i64 %95, ptr %15, align 8, !tbaa !15
  br label %96

96:                                               ; preds = %82, %79, %72
  call void asm sideeffect "", "=*r|m,*0,~{memory}"(ptr nonnull elementtype(%class.ConstantVector) %2, ptr nonnull elementtype(%class.ConstantVector) %2) #17, !srcloc !24
  %97 = add nuw nsw i32 %73, 1
  %98 = icmp eq i32 %97, %70
  br i1 %98, label %99, label %72, !llvm.loop !31

99:                                               ; preds = %96, %67
  %100 = load i64, ptr %17, align 8, !tbaa !34
  %101 = load i64, ptr %13, align 8, !tbaa !19
  %102 = icmp ugt i64 %100, %101
  br i1 %102, label %116, label %103

103:                                              ; preds = %99, %112
  %104 = phi i64 [ %113, %112 ], [ %101, %99 ]
  %105 = phi i64 [ %114, %112 ], [ %100, %99 ]
  %106 = load ptr, ptr %2, align 8, !tbaa !17
  %107 = getelementptr inbounds ptr, ptr %106, i64 %105
  %108 = load ptr, ptr %107, align 8, !tbaa !20
  %109 = icmp eq ptr %108, null
  br i1 %109, label %112, label %110

110:                                              ; preds = %103
  call void @_ZdlPv(ptr noundef nonnull %108) #18
  %111 = load i64, ptr %13, align 8, !tbaa !19
  br label %112

112:                                              ; preds = %110, %103
  %113 = phi i64 [ %104, %103 ], [ %111, %110 ]
  %114 = add i64 %105, 1
  %115 = icmp ugt i64 %114, %113
  br i1 %115, label %116, label %103, !llvm.loop !92

116:                                              ; preds = %112, %99
  %117 = load ptr, ptr %2, align 8, !tbaa !17
  call void @_ZdlPv(ptr noundef %117) #18
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %2) #17
  %118 = add nsw i64 %21, -1
  %119 = icmp eq i64 %118, 0
  br i1 %119, label %19, label %20, !prof !18

120:                                              ; preds = %48
  %121 = landingpad { ptr, i32 }
          cleanup
  br label %126

122:                                              ; preds = %66
  %123 = landingpad { ptr, i32 }
          cleanup
  br label %126

124:                                              ; preds = %46
  %125 = landingpad { ptr, i32 }
          cleanup
  br label %126

126:                                              ; preds = %122, %124, %120
  %127 = phi { ptr, i32 } [ %121, %120 ], [ %123, %122 ], [ %125, %124 ]
  %128 = call ptr @_ZN14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEED1Ev(ptr noundef nonnull %2) #17
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %2) #17
  resume { ptr, i32 } %127
}

; Function Attrs: ssp uwtable(sync)
define internal void @_ZL28BM_ConstantVectorPopNoShrinkRN9benchmark5StateE(ptr noundef nonnull align 8 dereferenceable(144) %0) #3 personality ptr @__gxx_personality_v0 {
  %2 = alloca %class.ConstantVector, align 8
  %3 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 5
  %4 = load i32, ptr %3, align 4, !tbaa !71
  %5 = icmp ne i32 %4, 0
  %6 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 2
  %7 = load i64, ptr %6, align 8
  tail call void @_ZN9benchmark5State16StartKeepRunningEv(ptr noundef nonnull %0)
  %8 = icmp eq i64 %7, 0
  %9 = select i1 %5, i1 true, i1 %8
  br i1 %9, label %19, label %10, !prof !18

10:                                               ; preds = %1
  %11 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 1
  %12 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 2
  %13 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 3
  %14 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 4
  %15 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 5
  %16 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 7
  %17 = getelementptr inbounds %class.ConstantVector, ptr %2, i64 0, i32 8
  %18 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 6
  br label %20

19:                                               ; preds = %107, %1
  call void @_ZN9benchmark5State17FinishKeepRunningEv(ptr noundef nonnull %0)
  ret void

20:                                               ; preds = %10, %107
  %21 = phi i64 [ %7, %10 ], [ %109, %107 ]
  call void @_ZN9benchmark5State11PauseTimingEv(ptr noundef nonnull %0)
  call void @llvm.lifetime.start.p0(i64 80, ptr nonnull %2) #17
  store <2 x i64> <i64 0, i64 256>, ptr %11, align 8, !tbaa !89
  store <2 x i64> <i64 0, i64 256>, ptr %13, align 8, !tbaa !89
  store <2 x i64> <i64 -1, i64 0>, ptr %15, align 8, !tbaa !90
  store <2 x i64> <i64 256, i64 0>, ptr %16, align 8, !tbaa !89
  %22 = call noalias nonnull dereferenceable(512) ptr @_Znwm(i64 noundef 512) #16
  store ptr %22, ptr %2, align 8, !tbaa !17
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(512) %22, i8 0, i64 512, i1 false), !tbaa !20
  %23 = call noalias nonnull dereferenceable(1024) ptr @_Znwm(i64 noundef 1024) #16
  store ptr %23, ptr %22, align 8, !tbaa !20
  %24 = load ptr, ptr %18, align 8, !tbaa !91
  %25 = load i64, ptr %24, align 8, !tbaa !38
  %26 = trunc i64 %25 to i32
  %27 = icmp sgt i32 %26, 0
  br i1 %27, label %28, label %66

28:                                               ; preds = %20, %55
  %29 = phi i32 [ %64, %55 ], [ 0, %20 ]
  %30 = load i64, ptr %15, align 8, !tbaa !15
  %31 = add nsw i64 %30, 1
  store i64 %31, ptr %15, align 8, !tbaa !15
  %32 = load i64, ptr %14, align 8, !tbaa !16
  %33 = icmp eq i64 %31, %32
  %34 = load ptr, ptr %2, align 8, !tbaa !17
  br i1 %33, label %37, label %35, !prof !18

35:                                               ; preds = %28
  %36 = load i64, ptr %13, align 8, !tbaa !19
  br label %55

37:                                               ; preds = %28
  store i64 0, ptr %15, align 8, !tbaa !15
  %38 = load i64, ptr %13, align 8, !tbaa !19
  %39 = add i64 %38, 1
  store i64 %39, ptr %13, align 8, !tbaa !19
  %40 = shl i64 %31, 1
  store i64 %40, ptr %14, align 8, !tbaa !16
  %41 = getelementptr inbounds ptr, ptr %34, i64 %39
  %42 = load ptr, ptr %41, align 8, !tbaa !20
  %43 = icmp eq ptr %42, null
  br i1 %43, label %44, label %55

44:                                               ; preds = %37
  %45 = icmp ugt i64 %40, 4611686018427387903
  br i1 %45, label %46, label %48

46:                                               ; preds = %44
  invoke void @_ZSt28__throw_bad_array_new_lengthB8ne180100v() #15
          to label %47 unwind label %115

47:                                               ; preds = %46
  unreachable

48:                                               ; preds = %44
  %49 = shl i64 %31, 3
  %50 = invoke noalias nonnull ptr @_Znwm(i64 noundef %49) #16
          to label %51 unwind label %111

51:                                               ; preds = %48
  store ptr %50, ptr %41, align 8, !tbaa !20
  %52 = load i64, ptr %12, align 8, !tbaa !21
  %53 = add i64 %52, %40
  store i64 %53, ptr %12, align 8, !tbaa !21
  %54 = load ptr, ptr %2, align 8, !tbaa !17
  br label %55

55:                                               ; preds = %51, %37, %35
  %56 = phi i64 [ 0, %37 ], [ 0, %51 ], [ %31, %35 ]
  %57 = phi i64 [ %39, %37 ], [ %39, %51 ], [ %36, %35 ]
  %58 = phi ptr [ %34, %37 ], [ %54, %51 ], [ %34, %35 ]
  %59 = getelementptr inbounds ptr, ptr %58, i64 %57
  %60 = load ptr, ptr %59, align 8, !tbaa !20
  %61 = getelementptr inbounds i32, ptr %60, i64 %56
  store i32 %29, ptr %61, align 4, !tbaa !22
  %62 = load i64, ptr %11, align 8, !tbaa !6
  %63 = add i64 %62, 1
  store i64 %63, ptr %11, align 8, !tbaa !6
  call void asm sideeffect "", "=*r|m,*0,~{memory}"(ptr nonnull elementtype(%class.ConstantVector) %2, ptr nonnull elementtype(%class.ConstantVector) %2) #17, !srcloc !24
  %64 = add nuw nsw i32 %29, 1
  %65 = icmp eq i32 %64, %26
  br i1 %65, label %66, label %28, !llvm.loop !25

66:                                               ; preds = %55, %20
  invoke void @_ZN9benchmark5State12ResumeTimingEv(ptr noundef nonnull %0)
          to label %67 unwind label %113

67:                                               ; preds = %66
  %68 = load ptr, ptr %18, align 8, !tbaa !91
  %69 = load i64, ptr %68, align 8, !tbaa !38
  %70 = trunc i64 %69 to i32
  %71 = icmp sgt i32 %70, 0
  br i1 %71, label %72, label %90

72:                                               ; preds = %67, %87
  %73 = phi i32 [ %88, %87 ], [ 0, %67 ]
  %74 = load i64, ptr %11, align 8, !tbaa !6
  %75 = add i64 %74, -1
  store i64 %75, ptr %11, align 8, !tbaa !6
  %76 = load i64, ptr %15, align 8, !tbaa !15
  %77 = add nsw i64 %76, -1
  store i64 %77, ptr %15, align 8, !tbaa !15
  %78 = icmp slt i64 %76, 1
  br i1 %78, label %79, label %87, !prof !18

79:                                               ; preds = %72
  %80 = load i64, ptr %13, align 8, !tbaa !19
  %81 = icmp eq i64 %80, 0
  br i1 %81, label %87, label %82

82:                                               ; preds = %79
  %83 = add i64 %80, -1
  store i64 %83, ptr %13, align 8, !tbaa !19
  %84 = load i64, ptr %14, align 8, !tbaa !16
  %85 = lshr i64 %84, 1
  store i64 %85, ptr %14, align 8, !tbaa !16
  %86 = add nsw i64 %85, -1
  store i64 %86, ptr %15, align 8, !tbaa !15
  br label %87

87:                                               ; preds = %82, %79, %72
  call void asm sideeffect "", "=*r|m,*0,~{memory}"(ptr nonnull elementtype(%class.ConstantVector) %2, ptr nonnull elementtype(%class.ConstantVector) %2) #17, !srcloc !24
  %88 = add nuw nsw i32 %73, 1
  %89 = icmp eq i32 %88, %70
  br i1 %89, label %90, label %72, !llvm.loop !32

90:                                               ; preds = %87, %67
  %91 = load i64, ptr %17, align 8, !tbaa !34
  %92 = load i64, ptr %13, align 8, !tbaa !19
  %93 = icmp ugt i64 %91, %92
  br i1 %93, label %107, label %94

94:                                               ; preds = %90, %103
  %95 = phi i64 [ %104, %103 ], [ %92, %90 ]
  %96 = phi i64 [ %105, %103 ], [ %91, %90 ]
  %97 = load ptr, ptr %2, align 8, !tbaa !17
  %98 = getelementptr inbounds ptr, ptr %97, i64 %96
  %99 = load ptr, ptr %98, align 8, !tbaa !20
  %100 = icmp eq ptr %99, null
  br i1 %100, label %103, label %101

101:                                              ; preds = %94
  call void @_ZdlPv(ptr noundef nonnull %99) #18
  %102 = load i64, ptr %13, align 8, !tbaa !19
  br label %103

103:                                              ; preds = %101, %94
  %104 = phi i64 [ %95, %94 ], [ %102, %101 ]
  %105 = add i64 %96, 1
  %106 = icmp ugt i64 %105, %104
  br i1 %106, label %107, label %94, !llvm.loop !92

107:                                              ; preds = %103, %90
  %108 = load ptr, ptr %2, align 8, !tbaa !17
  call void @_ZdlPv(ptr noundef %108) #18
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %2) #17
  %109 = add nsw i64 %21, -1
  %110 = icmp eq i64 %109, 0
  br i1 %110, label %19, label %20, !prof !18

111:                                              ; preds = %48
  %112 = landingpad { ptr, i32 }
          cleanup
  br label %117

113:                                              ; preds = %66
  %114 = landingpad { ptr, i32 }
          cleanup
  br label %117

115:                                              ; preds = %46
  %116 = landingpad { ptr, i32 }
          cleanup
  br label %117

117:                                              ; preds = %113, %115, %111
  %118 = phi { ptr, i32 } [ %112, %111 ], [ %114, %113 ], [ %116, %115 ]
  %119 = call ptr @_ZN14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEED1Ev(ptr noundef nonnull %2) #17
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %2) #17
  resume { ptr, i32 } %118
}

; Function Attrs: ssp uwtable(sync)
define internal void @_ZL23BM_ConstantVectorAccessRN9benchmark5StateE(ptr noundef nonnull align 8 dereferenceable(144) %0) #3 personality ptr @__gxx_personality_v0 {
  %2 = alloca i64, align 8
  %3 = alloca %class.ConstantVector, align 8
  %4 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 80, ptr nonnull %3) #17
  %5 = getelementptr inbounds %class.ConstantVector, ptr %3, i64 0, i32 1
  %6 = getelementptr inbounds %class.ConstantVector, ptr %3, i64 0, i32 2
  store <2 x i64> <i64 0, i64 256>, ptr %5, align 8, !tbaa !89
  %7 = getelementptr inbounds %class.ConstantVector, ptr %3, i64 0, i32 3
  %8 = getelementptr inbounds %class.ConstantVector, ptr %3, i64 0, i32 4
  store <2 x i64> <i64 0, i64 256>, ptr %7, align 8, !tbaa !89
  %9 = getelementptr inbounds %class.ConstantVector, ptr %3, i64 0, i32 5
  store <2 x i64> <i64 -1, i64 0>, ptr %9, align 8, !tbaa !90
  %10 = getelementptr inbounds %class.ConstantVector, ptr %3, i64 0, i32 7
  %11 = getelementptr inbounds %class.ConstantVector, ptr %3, i64 0, i32 8
  store <2 x i64> <i64 256, i64 0>, ptr %10, align 8, !tbaa !89
  %12 = tail call noalias nonnull dereferenceable(512) ptr @_Znwm(i64 noundef 512) #16
  store ptr %12, ptr %3, align 8, !tbaa !17
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(512) %12, i8 0, i64 512, i1 false), !tbaa !20
  %13 = tail call noalias nonnull dereferenceable(1024) ptr @_Znwm(i64 noundef 1024) #16
  store ptr %13, ptr %12, align 8, !tbaa !20
  %14 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 6
  %15 = load ptr, ptr %14, align 8, !tbaa !91
  %16 = load i64, ptr %15, align 8, !tbaa !38
  %17 = trunc i64 %16 to i32
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %19, label %57

19:                                               ; preds = %1, %46
  %20 = phi i32 [ %55, %46 ], [ 0, %1 ]
  %21 = load i64, ptr %9, align 8, !tbaa !15
  %22 = add nsw i64 %21, 1
  store i64 %22, ptr %9, align 8, !tbaa !15
  %23 = load i64, ptr %8, align 8, !tbaa !16
  %24 = icmp eq i64 %22, %23
  %25 = load ptr, ptr %3, align 8, !tbaa !17
  br i1 %24, label %28, label %26, !prof !18

26:                                               ; preds = %19
  %27 = load i64, ptr %7, align 8, !tbaa !19
  br label %46

28:                                               ; preds = %19
  store i64 0, ptr %9, align 8, !tbaa !15
  %29 = load i64, ptr %7, align 8, !tbaa !19
  %30 = add i64 %29, 1
  store i64 %30, ptr %7, align 8, !tbaa !19
  %31 = shl i64 %22, 1
  store i64 %31, ptr %8, align 8, !tbaa !16
  %32 = getelementptr inbounds ptr, ptr %25, i64 %30
  %33 = load ptr, ptr %32, align 8, !tbaa !20
  %34 = icmp eq ptr %33, null
  br i1 %34, label %35, label %46

35:                                               ; preds = %28
  %36 = icmp ugt i64 %31, 4611686018427387903
  br i1 %36, label %37, label %39

37:                                               ; preds = %35
  invoke void @_ZSt28__throw_bad_array_new_lengthB8ne180100v() #15
          to label %38 unwind label %88

38:                                               ; preds = %37
  unreachable

39:                                               ; preds = %35
  %40 = shl i64 %22, 3
  %41 = invoke noalias nonnull ptr @_Znwm(i64 noundef %40) #16
          to label %42 unwind label %86

42:                                               ; preds = %39
  store ptr %41, ptr %32, align 8, !tbaa !20
  %43 = load i64, ptr %6, align 8, !tbaa !21
  %44 = add i64 %43, %31
  store i64 %44, ptr %6, align 8, !tbaa !21
  %45 = load ptr, ptr %3, align 8, !tbaa !17
  br label %46

46:                                               ; preds = %42, %28, %26
  %47 = phi i64 [ 0, %28 ], [ 0, %42 ], [ %22, %26 ]
  %48 = phi i64 [ %30, %28 ], [ %30, %42 ], [ %27, %26 ]
  %49 = phi ptr [ %25, %28 ], [ %45, %42 ], [ %25, %26 ]
  %50 = getelementptr inbounds ptr, ptr %49, i64 %48
  %51 = load ptr, ptr %50, align 8, !tbaa !20
  %52 = getelementptr inbounds i32, ptr %51, i64 %47
  store i32 %20, ptr %52, align 4, !tbaa !22
  %53 = load i64, ptr %5, align 8, !tbaa !6
  %54 = add i64 %53, 1
  store i64 %54, ptr %5, align 8, !tbaa !6
  call void asm sideeffect "", "=*r|m,*0,~{memory}"(ptr nonnull elementtype(%class.ConstantVector) %3, ptr nonnull elementtype(%class.ConstantVector) %3) #17, !srcloc !24
  %55 = add nuw nsw i32 %20, 1
  %56 = icmp eq i32 %55, %17
  br i1 %56, label %57, label %19, !llvm.loop !25

57:                                               ; preds = %46, %1
  %58 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 5
  %59 = load i32, ptr %58, align 4, !tbaa !71
  %60 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 2
  %61 = load i64, ptr %60, align 8
  invoke void @_ZN9benchmark5State16StartKeepRunningEv(ptr noundef nonnull %0)
          to label %62 unwind label %90

62:                                               ; preds = %57
  %63 = icmp ne i32 %59, 0
  %64 = icmp eq i64 %61, 0
  %65 = select i1 %63, i1 true, i1 %64
  br i1 %65, label %66, label %92, !prof !18

66:                                               ; preds = %122, %62
  invoke void @_ZN9benchmark5State17FinishKeepRunningEv(ptr noundef nonnull %0)
          to label %67 unwind label %90

67:                                               ; preds = %66
  %68 = load i64, ptr %11, align 8, !tbaa !34
  %69 = load i64, ptr %7, align 8, !tbaa !19
  %70 = icmp ugt i64 %68, %69
  br i1 %70, label %84, label %71

71:                                               ; preds = %67, %80
  %72 = phi i64 [ %81, %80 ], [ %69, %67 ]
  %73 = phi i64 [ %82, %80 ], [ %68, %67 ]
  %74 = load ptr, ptr %3, align 8, !tbaa !17
  %75 = getelementptr inbounds ptr, ptr %74, i64 %73
  %76 = load ptr, ptr %75, align 8, !tbaa !20
  %77 = icmp eq ptr %76, null
  br i1 %77, label %80, label %78

78:                                               ; preds = %71
  call void @_ZdlPv(ptr noundef nonnull %76) #18
  %79 = load i64, ptr %7, align 8, !tbaa !19
  br label %80

80:                                               ; preds = %78, %71
  %81 = phi i64 [ %72, %71 ], [ %79, %78 ]
  %82 = add i64 %73, 1
  %83 = icmp ugt i64 %82, %81
  br i1 %83, label %84, label %71, !llvm.loop !92

84:                                               ; preds = %80, %67
  %85 = load ptr, ptr %3, align 8, !tbaa !17
  call void @_ZdlPv(ptr noundef %85) #18
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %3) #17
  ret void

86:                                               ; preds = %39
  %87 = landingpad { ptr, i32 }
          cleanup
  br label %126

88:                                               ; preds = %37
  %89 = landingpad { ptr, i32 }
          cleanup
  br label %126

90:                                               ; preds = %66, %57
  %91 = landingpad { ptr, i32 }
          cleanup
  br label %126

92:                                               ; preds = %62, %122
  %93 = phi i64 [ %124, %122 ], [ %61, %62 ]
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #17
  %94 = load ptr, ptr %14, align 8, !tbaa !91
  %95 = load i64, ptr %94, align 8, !tbaa !38
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #17
  store i64 0, ptr %2, align 8, !tbaa !38
  %96 = shl i64 %95, 32
  %97 = ashr exact i64 %96, 32
  %98 = and i64 %95, 4294967295
  %99 = icmp eq i64 %98, 0
  br i1 %99, label %122, label %102

100:                                              ; preds = %102
  %101 = load i64, ptr %2, align 8, !tbaa !38
  br label %122

102:                                              ; preds = %92, %102
  %103 = phi i64 [ %120, %102 ], [ 0, %92 ]
  %104 = trunc i64 %103 to i32
  %105 = add i32 %104, 256
  %106 = call i32 @llvm.ctlz.i32(i32 %105, i1 false), !range !39
  %107 = sub nsw i32 23, %106
  %108 = load ptr, ptr %3, align 8, !tbaa !17
  %109 = zext i32 %107 to i64
  %110 = getelementptr inbounds ptr, ptr %108, i64 %109
  %111 = load ptr, ptr %110, align 8, !tbaa !20
  %112 = zext i32 %105 to i64
  %113 = shl i64 -256, %109
  %114 = add i64 %113, %112
  %115 = getelementptr inbounds i32, ptr %111, i64 %114
  %116 = load i32, ptr %115, align 4, !tbaa !22
  %117 = sext i32 %116 to i64
  %118 = load i64, ptr %2, align 8, !tbaa !38
  %119 = add nsw i64 %118, %117
  store i64 %119, ptr %2, align 8, !tbaa !38
  call void asm sideeffect "", "=*r|m,0,~{memory}"(ptr nonnull elementtype(i64) %2, i64 %119) #17, !srcloc !24
  %120 = add nuw i64 %103, 1
  %121 = icmp eq i64 %120, %97
  br i1 %121, label %100, label %102, !llvm.loop !40

122:                                              ; preds = %100, %92
  %123 = phi i64 [ %101, %100 ], [ 0, %92 ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #17
  store i64 %123, ptr %4, align 8, !tbaa !38
  call void asm sideeffect "", "=*r|m,0,~{memory}"(ptr nonnull elementtype(i64) %4, i64 %123) #17, !srcloc !93
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #17
  %124 = add nsw i64 %93, -1
  %125 = icmp eq i64 %124, 0
  br i1 %125, label %66, label %92, !prof !18

126:                                              ; preds = %86, %88, %90
  %127 = phi { ptr, i32 } [ %91, %90 ], [ %87, %86 ], [ %89, %88 ]
  %128 = call ptr @_ZN14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEED1Ev(ptr noundef nonnull %3) #17
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %3) #17
  resume { ptr, i32 } %127
}

; Function Attrs: ssp uwtable(sync)
define internal void @_ZL26BM_ConstantVectorIterationRN9benchmark5StateE(ptr noundef nonnull align 8 dereferenceable(144) %0) #3 personality ptr @__gxx_personality_v0 {
  %2 = alloca i64, align 8
  %3 = alloca %class.ConstantVector, align 8
  %4 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 80, ptr nonnull %3) #17
  %5 = getelementptr inbounds %class.ConstantVector, ptr %3, i64 0, i32 1
  %6 = getelementptr inbounds %class.ConstantVector, ptr %3, i64 0, i32 2
  store <2 x i64> <i64 0, i64 256>, ptr %5, align 8, !tbaa !89
  %7 = getelementptr inbounds %class.ConstantVector, ptr %3, i64 0, i32 3
  %8 = getelementptr inbounds %class.ConstantVector, ptr %3, i64 0, i32 4
  store <2 x i64> <i64 0, i64 256>, ptr %7, align 8, !tbaa !89
  %9 = getelementptr inbounds %class.ConstantVector, ptr %3, i64 0, i32 5
  %10 = getelementptr inbounds %class.ConstantVector, ptr %3, i64 0, i32 6
  store <2 x i64> <i64 -1, i64 0>, ptr %9, align 8, !tbaa !90
  %11 = getelementptr inbounds %class.ConstantVector, ptr %3, i64 0, i32 7
  %12 = getelementptr inbounds %class.ConstantVector, ptr %3, i64 0, i32 8
  store <2 x i64> <i64 256, i64 0>, ptr %11, align 8, !tbaa !89
  %13 = tail call noalias nonnull dereferenceable(512) ptr @_Znwm(i64 noundef 512) #16
  store ptr %13, ptr %3, align 8, !tbaa !17
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(512) %13, i8 0, i64 512, i1 false), !tbaa !20
  %14 = tail call noalias nonnull dereferenceable(1024) ptr @_Znwm(i64 noundef 1024) #16
  store ptr %14, ptr %13, align 8, !tbaa !20
  %15 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 6
  %16 = load ptr, ptr %15, align 8, !tbaa !91
  %17 = load i64, ptr %16, align 8, !tbaa !38
  %18 = trunc i64 %17 to i32
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %20, label %58

20:                                               ; preds = %1, %47
  %21 = phi i32 [ %56, %47 ], [ 0, %1 ]
  %22 = load i64, ptr %9, align 8, !tbaa !15
  %23 = add nsw i64 %22, 1
  store i64 %23, ptr %9, align 8, !tbaa !15
  %24 = load i64, ptr %8, align 8, !tbaa !16
  %25 = icmp eq i64 %23, %24
  %26 = load ptr, ptr %3, align 8, !tbaa !17
  br i1 %25, label %29, label %27, !prof !18

27:                                               ; preds = %20
  %28 = load i64, ptr %7, align 8, !tbaa !19
  br label %47

29:                                               ; preds = %20
  store i64 0, ptr %9, align 8, !tbaa !15
  %30 = load i64, ptr %7, align 8, !tbaa !19
  %31 = add i64 %30, 1
  store i64 %31, ptr %7, align 8, !tbaa !19
  %32 = shl i64 %23, 1
  store i64 %32, ptr %8, align 8, !tbaa !16
  %33 = getelementptr inbounds ptr, ptr %26, i64 %31
  %34 = load ptr, ptr %33, align 8, !tbaa !20
  %35 = icmp eq ptr %34, null
  br i1 %35, label %36, label %47

36:                                               ; preds = %29
  %37 = icmp ugt i64 %32, 4611686018427387903
  br i1 %37, label %38, label %40

38:                                               ; preds = %36
  invoke void @_ZSt28__throw_bad_array_new_lengthB8ne180100v() #15
          to label %39 unwind label %89

39:                                               ; preds = %38
  unreachable

40:                                               ; preds = %36
  %41 = shl i64 %23, 3
  %42 = invoke noalias nonnull ptr @_Znwm(i64 noundef %41) #16
          to label %43 unwind label %87

43:                                               ; preds = %40
  store ptr %42, ptr %33, align 8, !tbaa !20
  %44 = load i64, ptr %6, align 8, !tbaa !21
  %45 = add i64 %44, %32
  store i64 %45, ptr %6, align 8, !tbaa !21
  %46 = load ptr, ptr %3, align 8, !tbaa !17
  br label %47

47:                                               ; preds = %43, %29, %27
  %48 = phi i64 [ 0, %29 ], [ 0, %43 ], [ %23, %27 ]
  %49 = phi i64 [ %31, %29 ], [ %31, %43 ], [ %28, %27 ]
  %50 = phi ptr [ %26, %29 ], [ %46, %43 ], [ %26, %27 ]
  %51 = getelementptr inbounds ptr, ptr %50, i64 %49
  %52 = load ptr, ptr %51, align 8, !tbaa !20
  %53 = getelementptr inbounds i32, ptr %52, i64 %48
  store i32 %21, ptr %53, align 4, !tbaa !22
  %54 = load i64, ptr %5, align 8, !tbaa !6
  %55 = add i64 %54, 1
  store i64 %55, ptr %5, align 8, !tbaa !6
  call void asm sideeffect "", "=*r|m,*0,~{memory}"(ptr nonnull elementtype(%class.ConstantVector) %3, ptr nonnull elementtype(%class.ConstantVector) %3) #17, !srcloc !24
  %56 = add nuw nsw i32 %21, 1
  %57 = icmp eq i32 %56, %18
  br i1 %57, label %58, label %20, !llvm.loop !25

58:                                               ; preds = %47, %1
  %59 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 5
  %60 = load i32, ptr %59, align 4, !tbaa !71
  %61 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 2
  %62 = load i64, ptr %61, align 8
  invoke void @_ZN9benchmark5State16StartKeepRunningEv(ptr noundef nonnull %0)
          to label %63 unwind label %91

63:                                               ; preds = %58
  %64 = icmp ne i32 %60, 0
  %65 = icmp eq i64 %62, 0
  %66 = select i1 %64, i1 true, i1 %65
  br i1 %66, label %67, label %93, !prof !18

67:                                               ; preds = %142, %63
  invoke void @_ZN9benchmark5State17FinishKeepRunningEv(ptr noundef nonnull %0)
          to label %68 unwind label %91

68:                                               ; preds = %67
  %69 = load i64, ptr %12, align 8, !tbaa !34
  %70 = load i64, ptr %7, align 8, !tbaa !19
  %71 = icmp ugt i64 %69, %70
  br i1 %71, label %85, label %72

72:                                               ; preds = %68, %81
  %73 = phi i64 [ %82, %81 ], [ %70, %68 ]
  %74 = phi i64 [ %83, %81 ], [ %69, %68 ]
  %75 = load ptr, ptr %3, align 8, !tbaa !17
  %76 = getelementptr inbounds ptr, ptr %75, i64 %74
  %77 = load ptr, ptr %76, align 8, !tbaa !20
  %78 = icmp eq ptr %77, null
  br i1 %78, label %81, label %79

79:                                               ; preds = %72
  call void @_ZdlPv(ptr noundef nonnull %77) #18
  %80 = load i64, ptr %7, align 8, !tbaa !19
  br label %81

81:                                               ; preds = %79, %72
  %82 = phi i64 [ %73, %72 ], [ %80, %79 ]
  %83 = add i64 %74, 1
  %84 = icmp ugt i64 %83, %82
  br i1 %84, label %85, label %72, !llvm.loop !92

85:                                               ; preds = %81, %68
  %86 = load ptr, ptr %3, align 8, !tbaa !17
  call void @_ZdlPv(ptr noundef %86) #18
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %3) #17
  ret void

87:                                               ; preds = %40
  %88 = landingpad { ptr, i32 }
          cleanup
  br label %146

89:                                               ; preds = %38
  %90 = landingpad { ptr, i32 }
          cleanup
  br label %146

91:                                               ; preds = %67, %58
  %92 = landingpad { ptr, i32 }
          cleanup
  br label %146

93:                                               ; preds = %63, %142
  %94 = phi i64 [ %144, %142 ], [ %62, %63 ]
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #17
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #17
  store i64 0, ptr %2, align 8, !tbaa !38
  %95 = load i64, ptr %5, align 8, !tbaa !6, !noalias !41
  %96 = icmp eq i64 %95, 0
  br i1 %96, label %142, label %97

97:                                               ; preds = %93
  %98 = load ptr, ptr %3, align 8, !tbaa !17, !noalias !41
  %99 = load i64, ptr %12, align 8, !tbaa !34, !noalias !94
  %100 = getelementptr inbounds ptr, ptr %98, i64 %99
  %101 = load ptr, ptr %100, align 8, !tbaa !20, !noalias !94
  %102 = load i64, ptr %10, align 8, !tbaa !33, !noalias !94
  %103 = shl i64 %102, 32
  %104 = ashr exact i64 %103, 32
  %105 = getelementptr inbounds i32, ptr %101, i64 %104
  %106 = load i64, ptr %7, align 8, !tbaa !19, !noalias !97
  %107 = getelementptr inbounds ptr, ptr %98, i64 %106
  %108 = load ptr, ptr %107, align 8, !tbaa !20, !noalias !97
  %109 = load i64, ptr %9, align 8, !tbaa !15, !noalias !97
  %110 = getelementptr inbounds i32, ptr %108, i64 %109
  %111 = getelementptr inbounds i32, ptr %110, i64 1
  %112 = icmp eq ptr %105, %111
  br i1 %112, label %142, label %113

113:                                              ; preds = %97
  %114 = shl i64 256, %99
  %115 = getelementptr inbounds i32, ptr %101, i64 %114
  br label %118

116:                                              ; preds = %137
  %117 = load i64, ptr %2, align 8, !tbaa !38
  br label %142

118:                                              ; preds = %113, %137
  %119 = phi ptr [ %140, %137 ], [ %115, %113 ]
  %120 = phi ptr [ %139, %137 ], [ %105, %113 ]
  %121 = phi ptr [ %138, %137 ], [ %100, %113 ]
  %122 = load i32, ptr %120, align 4, !tbaa !22
  %123 = sext i32 %122 to i64
  %124 = load i64, ptr %2, align 8, !tbaa !38
  %125 = add nsw i64 %124, %123
  store i64 %125, ptr %2, align 8, !tbaa !38
  call void asm sideeffect "", "=*r|m,0,~{memory}"(ptr nonnull elementtype(i64) %2, i64 %125) #17, !srcloc !24
  %126 = getelementptr inbounds i32, ptr %120, i64 1
  %127 = icmp eq ptr %126, %119
  br i1 %127, label %128, label %137, !prof !18

128:                                              ; preds = %118
  %129 = getelementptr inbounds ptr, ptr %121, i64 1
  %130 = load ptr, ptr %129, align 8, !tbaa !20
  %131 = load ptr, ptr %121, align 8, !tbaa !20
  %132 = ptrtoint ptr %119 to i64
  %133 = ptrtoint ptr %131 to i64
  %134 = sub i64 %132, %133
  %135 = ashr exact i64 %134, 1
  %136 = getelementptr inbounds i32, ptr %130, i64 %135
  br label %137

137:                                              ; preds = %128, %118
  %138 = phi ptr [ %129, %128 ], [ %121, %118 ]
  %139 = phi ptr [ %130, %128 ], [ %126, %118 ]
  %140 = phi ptr [ %136, %128 ], [ %119, %118 ]
  %141 = icmp eq ptr %139, %111
  br i1 %141, label %116, label %118

142:                                              ; preds = %116, %97, %93
  %143 = phi i64 [ %117, %116 ], [ 0, %97 ], [ 0, %93 ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #17
  store i64 %143, ptr %4, align 8, !tbaa !38
  call void asm sideeffect "", "=*r|m,0,~{memory}"(ptr nonnull elementtype(i64) %4, i64 %143) #17, !srcloc !93
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #17
  %144 = add nsw i64 %94, -1
  %145 = icmp eq i64 %144, 0
  br i1 %145, label %67, label %93, !prof !18

146:                                              ; preds = %87, %89, %91
  %147 = phi { ptr, i32 } [ %92, %91 ], [ %88, %87 ], [ %90, %89 ]
  %148 = call ptr @_ZN14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEED1Ev(ptr noundef nonnull %3) #17
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %3) #17
  resume { ptr, i32 } %147
}

; Function Attrs: ssp uwtable(sync)
define internal void @_ZL13BM_VectorPushRN9benchmark5StateE(ptr noundef nonnull align 8 dereferenceable(144) %0) #3 personality ptr @__gxx_personality_v0 {
  %2 = alloca %class.STLVector, align 8
  %3 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 5
  %4 = load i32, ptr %3, align 4, !tbaa !71
  %5 = icmp ne i32 %4, 0
  %6 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 2
  %7 = load i64, ptr %6, align 8
  tail call void @_ZN9benchmark5State16StartKeepRunningEv(ptr noundef nonnull %0)
  %8 = icmp eq i64 %7, 0
  %9 = select i1 %5, i1 true, i1 %8
  br i1 %9, label %14, label %10, !prof !18

10:                                               ; preds = %1
  %11 = getelementptr inbounds %class.STLVector, ptr %2, i64 0, i32 1
  %12 = getelementptr inbounds %class.STLVector, ptr %2, i64 0, i32 2
  %13 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 6
  br label %15

14:                                               ; preds = %93, %1
  call void @_ZN9benchmark5State17FinishKeepRunningEv(ptr noundef nonnull %0)
  ret void

15:                                               ; preds = %10, %93
  %16 = phi i64 [ %7, %10 ], [ %94, %93 ]
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %2) #17
  store <2 x i32> <i32 0, i32 8>, ptr %11, align 8, !tbaa !22
  %17 = call noalias nonnull dereferenceable(32) ptr @_Znwm(i64 noundef 32) #16
  store ptr %17, ptr %2, align 8, !tbaa !51
  %18 = load ptr, ptr %13, align 8, !tbaa !91
  %19 = load i64, ptr %18, align 8, !tbaa !38
  %20 = trunc i64 %19 to i32
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %22, label %91

22:                                               ; preds = %15, %80
  %23 = phi i32 [ %86, %80 ], [ 0, %15 ]
  %24 = load i32, ptr %11, align 8, !tbaa !48
  %25 = load i32, ptr %12, align 4, !tbaa !50
  %26 = icmp eq i32 %24, %25
  br i1 %26, label %29, label %27, !prof !18

27:                                               ; preds = %22
  %28 = load ptr, ptr %2, align 8, !tbaa !51
  br label %80

29:                                               ; preds = %22
  %30 = shl nsw i32 %24, 1
  store i32 %30, ptr %12, align 4, !tbaa !50
  %31 = icmp slt i32 %24, 0
  br i1 %31, label %32, label %34

32:                                               ; preds = %29
  invoke void @_ZSt28__throw_bad_array_new_lengthB8ne180100v() #15
          to label %33 unwind label %98

33:                                               ; preds = %32
  unreachable

34:                                               ; preds = %29
  %35 = sext i32 %30 to i64
  %36 = shl nuw nsw i64 %35, 2
  %37 = invoke noalias nonnull ptr @_Znwm(i64 noundef %36) #16
          to label %38 unwind label %96

38:                                               ; preds = %34
  %39 = icmp eq i32 %24, 0
  %40 = load ptr, ptr %2, align 8, !tbaa !51
  br i1 %39, label %71, label %41

41:                                               ; preds = %38
  %42 = ptrtoint ptr %40 to i64
  %43 = ptrtoint ptr %37 to i64
  %44 = zext i32 %24 to i64
  %45 = icmp ult i32 %24, 16
  %46 = sub i64 %43, %42
  %47 = icmp ult i64 %46, 64
  %48 = select i1 %45, i1 true, i1 %47
  br i1 %48, label %69, label %49

49:                                               ; preds = %41
  %50 = and i64 %44, 4294967280
  br label %51

51:                                               ; preds = %51, %49
  %52 = phi i64 [ 0, %49 ], [ %65, %51 ]
  %53 = getelementptr inbounds i32, ptr %40, i64 %52
  %54 = load <4 x i32>, ptr %53, align 4, !tbaa !22
  %55 = getelementptr inbounds i32, ptr %53, i64 4
  %56 = load <4 x i32>, ptr %55, align 4, !tbaa !22
  %57 = getelementptr inbounds i32, ptr %53, i64 8
  %58 = load <4 x i32>, ptr %57, align 4, !tbaa !22
  %59 = getelementptr inbounds i32, ptr %53, i64 12
  %60 = load <4 x i32>, ptr %59, align 4, !tbaa !22
  %61 = getelementptr inbounds i32, ptr %37, i64 %52
  store <4 x i32> %54, ptr %61, align 4, !tbaa !22
  %62 = getelementptr inbounds i32, ptr %61, i64 4
  store <4 x i32> %56, ptr %62, align 4, !tbaa !22
  %63 = getelementptr inbounds i32, ptr %61, i64 8
  store <4 x i32> %58, ptr %63, align 4, !tbaa !22
  %64 = getelementptr inbounds i32, ptr %61, i64 12
  store <4 x i32> %60, ptr %64, align 4, !tbaa !22
  %65 = add nuw i64 %52, 16
  %66 = icmp eq i64 %65, %50
  br i1 %66, label %67, label %51, !llvm.loop !100

67:                                               ; preds = %51
  %68 = icmp eq i64 %50, %44
  br i1 %68, label %71, label %69

69:                                               ; preds = %41, %67
  %70 = phi i64 [ 0, %41 ], [ %50, %67 ]
  br label %73

71:                                               ; preds = %73, %67, %38
  call void @_ZdlPv(ptr noundef %40) #18
  store ptr %37, ptr %2, align 8, !tbaa !51
  %72 = load i32, ptr %11, align 8, !tbaa !48
  br label %80

73:                                               ; preds = %69, %73
  %74 = phi i64 [ %78, %73 ], [ %70, %69 ]
  %75 = getelementptr inbounds i32, ptr %40, i64 %74
  %76 = load i32, ptr %75, align 4, !tbaa !22
  %77 = getelementptr inbounds i32, ptr %37, i64 %74
  store i32 %76, ptr %77, align 4, !tbaa !22
  %78 = add nuw nsw i64 %74, 1
  %79 = icmp eq i64 %78, %44
  br i1 %79, label %71, label %73, !llvm.loop !101

80:                                               ; preds = %71, %27
  %81 = phi i32 [ %24, %27 ], [ %72, %71 ]
  %82 = phi ptr [ %28, %27 ], [ %37, %71 ]
  %83 = add nsw i32 %81, 1
  store i32 %83, ptr %11, align 8, !tbaa !48
  %84 = sext i32 %81 to i64
  %85 = getelementptr inbounds i32, ptr %82, i64 %84
  store i32 %23, ptr %85, align 4, !tbaa !22
  call void asm sideeffect "", "=*r|m,*0,~{memory}"(ptr nonnull elementtype(%class.STLVector) %2, ptr nonnull elementtype(%class.STLVector) %2) #17, !srcloc !24
  %86 = add nuw nsw i32 %23, 1
  %87 = icmp eq i32 %86, %20
  br i1 %87, label %88, label %22, !llvm.loop !56

88:                                               ; preds = %80
  %89 = load ptr, ptr %2, align 8, !tbaa !51
  %90 = icmp eq ptr %89, null
  br i1 %90, label %93, label %91

91:                                               ; preds = %15, %88
  %92 = phi ptr [ %89, %88 ], [ %17, %15 ]
  call void @_ZdlPv(ptr noundef nonnull %92) #18
  br label %93

93:                                               ; preds = %88, %91
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %2) #17
  %94 = add nsw i64 %16, -1
  %95 = icmp eq i64 %94, 0
  br i1 %95, label %14, label %15, !prof !18

96:                                               ; preds = %34
  %97 = landingpad { ptr, i32 }
          cleanup
  br label %100

98:                                               ; preds = %32
  %99 = landingpad { ptr, i32 }
          cleanup
  br label %100

100:                                              ; preds = %98, %96
  %101 = phi { ptr, i32 } [ %97, %96 ], [ %99, %98 ]
  %102 = load ptr, ptr %2, align 8, !tbaa !51
  %103 = icmp eq ptr %102, null
  br i1 %103, label %105, label %104

104:                                              ; preds = %100
  call void @_ZdlPv(ptr noundef nonnull %102) #18
  br label %105

105:                                              ; preds = %100, %104
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %2) #17
  resume { ptr, i32 } %101
}

; Function Attrs: ssp uwtable(sync)
define internal void @_ZL12BM_VectorPopRN9benchmark5StateE(ptr noundef nonnull align 8 dereferenceable(144) %0) #3 personality ptr @__gxx_personality_v0 {
  %2 = alloca %class.STLVector, align 8
  %3 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 5
  %4 = load i32, ptr %3, align 4, !tbaa !71
  %5 = icmp ne i32 %4, 0
  %6 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 2
  %7 = load i64, ptr %6, align 8
  tail call void @_ZN9benchmark5State16StartKeepRunningEv(ptr noundef nonnull %0)
  %8 = icmp eq i64 %7, 0
  %9 = select i1 %5, i1 true, i1 %8
  br i1 %9, label %14, label %10, !prof !18

10:                                               ; preds = %1
  %11 = getelementptr inbounds %class.STLVector, ptr %2, i64 0, i32 1
  %12 = getelementptr inbounds %class.STLVector, ptr %2, i64 0, i32 2
  %13 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 6
  br label %15

14:                                               ; preds = %155, %1
  call void @_ZN9benchmark5State17FinishKeepRunningEv(ptr noundef nonnull %0)
  ret void

15:                                               ; preds = %10, %155
  %16 = phi i64 [ %7, %10 ], [ %156, %155 ]
  call void @_ZN9benchmark5State11PauseTimingEv(ptr noundef nonnull %0)
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %2) #17
  store <2 x i32> <i32 0, i32 8>, ptr %11, align 8, !tbaa !22
  %17 = call noalias nonnull dereferenceable(32) ptr @_Znwm(i64 noundef 32) #16
  store ptr %17, ptr %2, align 8, !tbaa !51
  %18 = load ptr, ptr %13, align 8, !tbaa !91
  %19 = load i64, ptr %18, align 8, !tbaa !38
  %20 = trunc i64 %19 to i32
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %22, label %88

22:                                               ; preds = %15, %80
  %23 = phi i32 [ %86, %80 ], [ 0, %15 ]
  %24 = load i32, ptr %11, align 8, !tbaa !48
  %25 = load i32, ptr %12, align 4, !tbaa !50
  %26 = icmp eq i32 %24, %25
  br i1 %26, label %29, label %27, !prof !18

27:                                               ; preds = %22
  %28 = load ptr, ptr %2, align 8, !tbaa !51
  br label %80

29:                                               ; preds = %22
  %30 = shl nsw i32 %24, 1
  store i32 %30, ptr %12, align 4, !tbaa !50
  %31 = icmp slt i32 %24, 0
  br i1 %31, label %32, label %34

32:                                               ; preds = %29, %101
  invoke void @_ZSt28__throw_bad_array_new_lengthB8ne180100v() #15
          to label %33 unwind label %164

33:                                               ; preds = %32
  unreachable

34:                                               ; preds = %29
  %35 = sext i32 %30 to i64
  %36 = shl nuw nsw i64 %35, 2
  %37 = invoke noalias nonnull ptr @_Znwm(i64 noundef %36) #16
          to label %38 unwind label %160

38:                                               ; preds = %34
  %39 = icmp eq i32 %24, 0
  %40 = load ptr, ptr %2, align 8, !tbaa !51
  br i1 %39, label %71, label %41

41:                                               ; preds = %38
  %42 = ptrtoint ptr %40 to i64
  %43 = ptrtoint ptr %37 to i64
  %44 = zext i32 %24 to i64
  %45 = icmp ult i32 %24, 16
  %46 = sub i64 %43, %42
  %47 = icmp ult i64 %46, 64
  %48 = select i1 %45, i1 true, i1 %47
  br i1 %48, label %69, label %49

49:                                               ; preds = %41
  %50 = and i64 %44, 4294967280
  br label %51

51:                                               ; preds = %51, %49
  %52 = phi i64 [ 0, %49 ], [ %65, %51 ]
  %53 = getelementptr inbounds i32, ptr %40, i64 %52
  %54 = load <4 x i32>, ptr %53, align 4, !tbaa !22
  %55 = getelementptr inbounds i32, ptr %53, i64 4
  %56 = load <4 x i32>, ptr %55, align 4, !tbaa !22
  %57 = getelementptr inbounds i32, ptr %53, i64 8
  %58 = load <4 x i32>, ptr %57, align 4, !tbaa !22
  %59 = getelementptr inbounds i32, ptr %53, i64 12
  %60 = load <4 x i32>, ptr %59, align 4, !tbaa !22
  %61 = getelementptr inbounds i32, ptr %37, i64 %52
  store <4 x i32> %54, ptr %61, align 4, !tbaa !22
  %62 = getelementptr inbounds i32, ptr %61, i64 4
  store <4 x i32> %56, ptr %62, align 4, !tbaa !22
  %63 = getelementptr inbounds i32, ptr %61, i64 8
  store <4 x i32> %58, ptr %63, align 4, !tbaa !22
  %64 = getelementptr inbounds i32, ptr %61, i64 12
  store <4 x i32> %60, ptr %64, align 4, !tbaa !22
  %65 = add nuw i64 %52, 16
  %66 = icmp eq i64 %65, %50
  br i1 %66, label %67, label %51, !llvm.loop !102

67:                                               ; preds = %51
  %68 = icmp eq i64 %50, %44
  br i1 %68, label %71, label %69

69:                                               ; preds = %41, %67
  %70 = phi i64 [ 0, %41 ], [ %50, %67 ]
  br label %73

71:                                               ; preds = %73, %67, %38
  call void @_ZdlPv(ptr noundef %40) #18
  store ptr %37, ptr %2, align 8, !tbaa !51
  %72 = load i32, ptr %11, align 8, !tbaa !48
  br label %80

73:                                               ; preds = %69, %73
  %74 = phi i64 [ %78, %73 ], [ %70, %69 ]
  %75 = getelementptr inbounds i32, ptr %40, i64 %74
  %76 = load i32, ptr %75, align 4, !tbaa !22
  %77 = getelementptr inbounds i32, ptr %37, i64 %74
  store i32 %76, ptr %77, align 4, !tbaa !22
  %78 = add nuw nsw i64 %74, 1
  %79 = icmp eq i64 %78, %44
  br i1 %79, label %71, label %73, !llvm.loop !103

80:                                               ; preds = %71, %27
  %81 = phi i32 [ %24, %27 ], [ %72, %71 ]
  %82 = phi ptr [ %28, %27 ], [ %37, %71 ]
  %83 = add nsw i32 %81, 1
  store i32 %83, ptr %11, align 8, !tbaa !48
  %84 = sext i32 %81 to i64
  %85 = getelementptr inbounds i32, ptr %82, i64 %84
  store i32 %23, ptr %85, align 4, !tbaa !22
  call void asm sideeffect "", "=*r|m,*0,~{memory}"(ptr nonnull elementtype(%class.STLVector) %2, ptr nonnull elementtype(%class.STLVector) %2) #17, !srcloc !24
  %86 = add nuw nsw i32 %23, 1
  %87 = icmp eq i32 %86, %20
  br i1 %87, label %88, label %22, !llvm.loop !56

88:                                               ; preds = %80, %15
  invoke void @_ZN9benchmark5State12ResumeTimingEv(ptr noundef nonnull %0)
          to label %89 unwind label %162

89:                                               ; preds = %88
  %90 = load ptr, ptr %13, align 8, !tbaa !91
  %91 = load i64, ptr %90, align 8, !tbaa !38
  %92 = trunc i64 %91 to i32
  %93 = icmp sgt i32 %92, 0
  br i1 %93, label %94, label %151

94:                                               ; preds = %89, %148
  %95 = phi i32 [ %149, %148 ], [ 0, %89 ]
  %96 = load i32, ptr %11, align 8, !tbaa !48
  %97 = add nsw i32 %96, -1
  store i32 %97, ptr %11, align 8, !tbaa !48
  %98 = load i32, ptr %12, align 4, !tbaa !50
  %99 = sdiv i32 %98, 2
  %100 = icmp sgt i32 %97, %99
  br i1 %100, label %148, label %101, !prof !61

101:                                              ; preds = %94
  store i32 %99, ptr %12, align 4, !tbaa !50
  %102 = icmp slt i32 %98, -1
  br i1 %102, label %32, label %103

103:                                              ; preds = %101
  %104 = sext i32 %99 to i64
  %105 = shl nuw nsw i64 %104, 2
  %106 = invoke noalias nonnull ptr @_Znwm(i64 noundef %105) #16
          to label %107 unwind label %158

107:                                              ; preds = %103
  %108 = icmp sgt i32 %96, 1
  %109 = load ptr, ptr %2, align 8, !tbaa !51
  br i1 %108, label %110, label %140

110:                                              ; preds = %107
  %111 = ptrtoint ptr %109 to i64
  %112 = ptrtoint ptr %106 to i64
  %113 = zext i32 %97 to i64
  %114 = icmp ult i32 %96, 17
  %115 = sub i64 %112, %111
  %116 = icmp ult i64 %115, 64
  %117 = select i1 %114, i1 true, i1 %116
  br i1 %117, label %138, label %118

118:                                              ; preds = %110
  %119 = and i64 %113, 4294967280
  br label %120

120:                                              ; preds = %120, %118
  %121 = phi i64 [ 0, %118 ], [ %134, %120 ]
  %122 = getelementptr inbounds i32, ptr %109, i64 %121
  %123 = load <4 x i32>, ptr %122, align 4, !tbaa !22
  %124 = getelementptr inbounds i32, ptr %122, i64 4
  %125 = load <4 x i32>, ptr %124, align 4, !tbaa !22
  %126 = getelementptr inbounds i32, ptr %122, i64 8
  %127 = load <4 x i32>, ptr %126, align 4, !tbaa !22
  %128 = getelementptr inbounds i32, ptr %122, i64 12
  %129 = load <4 x i32>, ptr %128, align 4, !tbaa !22
  %130 = getelementptr inbounds i32, ptr %106, i64 %121
  store <4 x i32> %123, ptr %130, align 4, !tbaa !22
  %131 = getelementptr inbounds i32, ptr %130, i64 4
  store <4 x i32> %125, ptr %131, align 4, !tbaa !22
  %132 = getelementptr inbounds i32, ptr %130, i64 8
  store <4 x i32> %127, ptr %132, align 4, !tbaa !22
  %133 = getelementptr inbounds i32, ptr %130, i64 12
  store <4 x i32> %129, ptr %133, align 4, !tbaa !22
  %134 = add nuw i64 %121, 16
  %135 = icmp eq i64 %134, %119
  br i1 %135, label %136, label %120, !llvm.loop !104

136:                                              ; preds = %120
  %137 = icmp eq i64 %119, %113
  br i1 %137, label %140, label %138

138:                                              ; preds = %110, %136
  %139 = phi i64 [ 0, %110 ], [ %119, %136 ]
  br label %141

140:                                              ; preds = %141, %136, %107
  call void @_ZdlPv(ptr noundef %109) #18
  store ptr %106, ptr %2, align 8, !tbaa !51
  br label %148

141:                                              ; preds = %138, %141
  %142 = phi i64 [ %146, %141 ], [ %139, %138 ]
  %143 = getelementptr inbounds i32, ptr %109, i64 %142
  %144 = load i32, ptr %143, align 4, !tbaa !22
  %145 = getelementptr inbounds i32, ptr %106, i64 %142
  store i32 %144, ptr %145, align 4, !tbaa !22
  %146 = add nuw nsw i64 %142, 1
  %147 = icmp eq i64 %146, %113
  br i1 %147, label %140, label %141, !llvm.loop !105

148:                                              ; preds = %140, %94
  call void asm sideeffect "", "=*r|m,*0,~{memory}"(ptr nonnull elementtype(%class.STLVector) %2, ptr nonnull elementtype(%class.STLVector) %2) #17, !srcloc !24
  %149 = add nuw nsw i32 %95, 1
  %150 = icmp eq i32 %149, %92
  br i1 %150, label %151, label %94, !llvm.loop !67

151:                                              ; preds = %148, %89
  %152 = load ptr, ptr %2, align 8, !tbaa !51
  %153 = icmp eq ptr %152, null
  br i1 %153, label %155, label %154

154:                                              ; preds = %151
  call void @_ZdlPv(ptr noundef nonnull %152) #18
  br label %155

155:                                              ; preds = %151, %154
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %2) #17
  %156 = add nsw i64 %16, -1
  %157 = icmp eq i64 %156, 0
  br i1 %157, label %14, label %15, !prof !18

158:                                              ; preds = %103
  %159 = landingpad { ptr, i32 }
          cleanup
  br label %166

160:                                              ; preds = %34
  %161 = landingpad { ptr, i32 }
          cleanup
  br label %166

162:                                              ; preds = %88
  %163 = landingpad { ptr, i32 }
          cleanup
  br label %166

164:                                              ; preds = %32
  %165 = landingpad { ptr, i32 }
          cleanup
  br label %166

166:                                              ; preds = %160, %164, %162, %158
  %167 = phi { ptr, i32 } [ %159, %158 ], [ %161, %160 ], [ %163, %162 ], [ %165, %164 ]
  %168 = load ptr, ptr %2, align 8, !tbaa !51
  %169 = icmp eq ptr %168, null
  br i1 %169, label %171, label %170

170:                                              ; preds = %166
  call void @_ZdlPv(ptr noundef nonnull %168) #18
  br label %171

171:                                              ; preds = %166, %170
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %2) #17
  resume { ptr, i32 } %167
}

; Function Attrs: ssp uwtable(sync)
define internal void @_ZL15BM_VectorAccessRN9benchmark5StateE(ptr noundef nonnull align 8 dereferenceable(144) %0) #3 personality ptr @__gxx_personality_v0 {
  %2 = alloca i64, align 8
  %3 = alloca %class.STLVector, align 8
  %4 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %3) #17
  %5 = getelementptr inbounds %class.STLVector, ptr %3, i64 0, i32 1
  %6 = getelementptr inbounds %class.STLVector, ptr %3, i64 0, i32 2
  store <2 x i32> <i32 0, i32 8>, ptr %5, align 8, !tbaa !22
  %7 = tail call noalias nonnull dereferenceable(32) ptr @_Znwm(i64 noundef 32) #16
  store ptr %7, ptr %3, align 8, !tbaa !51
  %8 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 6
  %9 = load ptr, ptr %8, align 8, !tbaa !91
  %10 = load i64, ptr %9, align 8, !tbaa !38
  %11 = trunc i64 %10 to i32
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %79

13:                                               ; preds = %1, %71
  %14 = phi i32 [ %77, %71 ], [ 0, %1 ]
  %15 = load i32, ptr %5, align 8, !tbaa !48
  %16 = load i32, ptr %6, align 4, !tbaa !50
  %17 = icmp eq i32 %15, %16
  br i1 %17, label %20, label %18, !prof !18

18:                                               ; preds = %13
  %19 = load ptr, ptr %3, align 8, !tbaa !51
  br label %71

20:                                               ; preds = %13
  %21 = shl nsw i32 %15, 1
  store i32 %21, ptr %6, align 4, !tbaa !50
  %22 = icmp slt i32 %15, 0
  br i1 %22, label %23, label %25

23:                                               ; preds = %20
  invoke void @_ZSt28__throw_bad_array_new_lengthB8ne180100v() #15
          to label %24 unwind label %96

24:                                               ; preds = %23
  unreachable

25:                                               ; preds = %20
  %26 = sext i32 %21 to i64
  %27 = shl nuw nsw i64 %26, 2
  %28 = invoke noalias nonnull ptr @_Znwm(i64 noundef %27) #16
          to label %29 unwind label %94

29:                                               ; preds = %25
  %30 = icmp eq i32 %15, 0
  %31 = load ptr, ptr %3, align 8, !tbaa !51
  br i1 %30, label %62, label %32

32:                                               ; preds = %29
  %33 = ptrtoint ptr %31 to i64
  %34 = ptrtoint ptr %28 to i64
  %35 = zext i32 %15 to i64
  %36 = icmp ult i32 %15, 16
  %37 = sub i64 %34, %33
  %38 = icmp ult i64 %37, 64
  %39 = select i1 %36, i1 true, i1 %38
  br i1 %39, label %60, label %40

40:                                               ; preds = %32
  %41 = and i64 %35, 4294967280
  br label %42

42:                                               ; preds = %42, %40
  %43 = phi i64 [ 0, %40 ], [ %56, %42 ]
  %44 = getelementptr inbounds i32, ptr %31, i64 %43
  %45 = load <4 x i32>, ptr %44, align 4, !tbaa !22
  %46 = getelementptr inbounds i32, ptr %44, i64 4
  %47 = load <4 x i32>, ptr %46, align 4, !tbaa !22
  %48 = getelementptr inbounds i32, ptr %44, i64 8
  %49 = load <4 x i32>, ptr %48, align 4, !tbaa !22
  %50 = getelementptr inbounds i32, ptr %44, i64 12
  %51 = load <4 x i32>, ptr %50, align 4, !tbaa !22
  %52 = getelementptr inbounds i32, ptr %28, i64 %43
  store <4 x i32> %45, ptr %52, align 4, !tbaa !22
  %53 = getelementptr inbounds i32, ptr %52, i64 4
  store <4 x i32> %47, ptr %53, align 4, !tbaa !22
  %54 = getelementptr inbounds i32, ptr %52, i64 8
  store <4 x i32> %49, ptr %54, align 4, !tbaa !22
  %55 = getelementptr inbounds i32, ptr %52, i64 12
  store <4 x i32> %51, ptr %55, align 4, !tbaa !22
  %56 = add nuw i64 %43, 16
  %57 = icmp eq i64 %56, %41
  br i1 %57, label %58, label %42, !llvm.loop !106

58:                                               ; preds = %42
  %59 = icmp eq i64 %41, %35
  br i1 %59, label %62, label %60

60:                                               ; preds = %32, %58
  %61 = phi i64 [ 0, %32 ], [ %41, %58 ]
  br label %64

62:                                               ; preds = %64, %58, %29
  call void @_ZdlPv(ptr noundef %31) #18
  store ptr %28, ptr %3, align 8, !tbaa !51
  %63 = load i32, ptr %5, align 8, !tbaa !48
  br label %71

64:                                               ; preds = %60, %64
  %65 = phi i64 [ %69, %64 ], [ %61, %60 ]
  %66 = getelementptr inbounds i32, ptr %31, i64 %65
  %67 = load i32, ptr %66, align 4, !tbaa !22
  %68 = getelementptr inbounds i32, ptr %28, i64 %65
  store i32 %67, ptr %68, align 4, !tbaa !22
  %69 = add nuw nsw i64 %65, 1
  %70 = icmp eq i64 %69, %35
  br i1 %70, label %62, label %64, !llvm.loop !107

71:                                               ; preds = %62, %18
  %72 = phi i32 [ %15, %18 ], [ %63, %62 ]
  %73 = phi ptr [ %19, %18 ], [ %28, %62 ]
  %74 = add nsw i32 %72, 1
  store i32 %74, ptr %5, align 8, !tbaa !48
  %75 = sext i32 %72 to i64
  %76 = getelementptr inbounds i32, ptr %73, i64 %75
  store i32 %14, ptr %76, align 4, !tbaa !22
  call void asm sideeffect "", "=*r|m,*0,~{memory}"(ptr nonnull elementtype(%class.STLVector) %3, ptr nonnull elementtype(%class.STLVector) %3) #17, !srcloc !24
  %77 = add nuw nsw i32 %14, 1
  %78 = icmp eq i32 %77, %11
  br i1 %78, label %79, label %13, !llvm.loop !56

79:                                               ; preds = %71, %1
  %80 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 5
  %81 = load i32, ptr %80, align 4, !tbaa !71
  %82 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 2
  %83 = load i64, ptr %82, align 8
  invoke void @_ZN9benchmark5State16StartKeepRunningEv(ptr noundef nonnull %0)
          to label %84 unwind label %98

84:                                               ; preds = %79
  %85 = icmp ne i32 %81, 0
  %86 = icmp eq i64 %83, 0
  %87 = select i1 %85, i1 true, i1 %86
  br i1 %87, label %88, label %100, !prof !18

88:                                               ; preds = %120, %84
  invoke void @_ZN9benchmark5State17FinishKeepRunningEv(ptr noundef nonnull %0)
          to label %89 unwind label %98

89:                                               ; preds = %88
  %90 = load ptr, ptr %3, align 8, !tbaa !51
  %91 = icmp eq ptr %90, null
  br i1 %91, label %93, label %92

92:                                               ; preds = %89
  call void @_ZdlPv(ptr noundef nonnull %90) #18
  br label %93

93:                                               ; preds = %89, %92
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #17
  ret void

94:                                               ; preds = %25
  %95 = landingpad { ptr, i32 }
          cleanup
  br label %124

96:                                               ; preds = %23
  %97 = landingpad { ptr, i32 }
          cleanup
  br label %124

98:                                               ; preds = %88, %79
  %99 = landingpad { ptr, i32 }
          cleanup
  br label %124

100:                                              ; preds = %84, %120
  %101 = phi i64 [ %122, %120 ], [ %83, %84 ]
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #17
  %102 = load ptr, ptr %8, align 8, !tbaa !91
  %103 = load i64, ptr %102, align 8, !tbaa !38
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #17
  store i64 0, ptr %2, align 8, !tbaa !38
  %104 = shl i64 %103, 32
  %105 = ashr exact i64 %104, 32
  %106 = and i64 %103, 4294967295
  %107 = icmp eq i64 %106, 0
  br i1 %107, label %120, label %110

108:                                              ; preds = %110
  %109 = load i64, ptr %2, align 8, !tbaa !38
  br label %120

110:                                              ; preds = %100, %110
  %111 = phi i64 [ %118, %110 ], [ 0, %100 ]
  %112 = load ptr, ptr %3, align 8, !tbaa !51
  %113 = getelementptr inbounds i32, ptr %112, i64 %111
  %114 = load i32, ptr %113, align 4, !tbaa !22
  %115 = sext i32 %114 to i64
  %116 = load i64, ptr %2, align 8, !tbaa !38
  %117 = add nsw i64 %116, %115
  store i64 %117, ptr %2, align 8, !tbaa !38
  call void asm sideeffect "", "=*r|m,0,~{memory}"(ptr nonnull elementtype(i64) %2, i64 %117) #17, !srcloc !24
  %118 = add nuw i64 %111, 1
  %119 = icmp eq i64 %118, %105
  br i1 %119, label %108, label %110, !llvm.loop !57

120:                                              ; preds = %108, %100
  %121 = phi i64 [ %109, %108 ], [ 0, %100 ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #17
  store i64 %121, ptr %4, align 8, !tbaa !38
  call void asm sideeffect "", "=*r|m,0,~{memory}"(ptr nonnull elementtype(i64) %4, i64 %121) #17, !srcloc !93
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #17
  %122 = add nsw i64 %101, -1
  %123 = icmp eq i64 %122, 0
  br i1 %123, label %88, label %100, !prof !18

124:                                              ; preds = %94, %96, %98
  %125 = phi { ptr, i32 } [ %99, %98 ], [ %95, %94 ], [ %97, %96 ]
  %126 = load ptr, ptr %3, align 8, !tbaa !51
  %127 = icmp eq ptr %126, null
  br i1 %127, label %129, label %128

128:                                              ; preds = %124
  call void @_ZdlPv(ptr noundef nonnull %126) #18
  br label %129

129:                                              ; preds = %124, %128
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #17
  resume { ptr, i32 } %125
}

; Function Attrs: ssp uwtable(sync)
define internal void @_ZL18BM_VectorIterationRN9benchmark5StateE(ptr noundef nonnull align 8 dereferenceable(144) %0) #3 personality ptr @__gxx_personality_v0 {
  %2 = alloca i64, align 8
  %3 = alloca %class.STLVector, align 8
  %4 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %3) #17
  %5 = getelementptr inbounds %class.STLVector, ptr %3, i64 0, i32 1
  %6 = getelementptr inbounds %class.STLVector, ptr %3, i64 0, i32 2
  store <2 x i32> <i32 0, i32 8>, ptr %5, align 8, !tbaa !22
  %7 = tail call noalias nonnull dereferenceable(32) ptr @_Znwm(i64 noundef 32) #16
  store ptr %7, ptr %3, align 8, !tbaa !51
  %8 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 6
  %9 = load ptr, ptr %8, align 8, !tbaa !91
  %10 = load i64, ptr %9, align 8, !tbaa !38
  %11 = trunc i64 %10 to i32
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %79

13:                                               ; preds = %1, %71
  %14 = phi i32 [ %77, %71 ], [ 0, %1 ]
  %15 = load i32, ptr %5, align 8, !tbaa !48
  %16 = load i32, ptr %6, align 4, !tbaa !50
  %17 = icmp eq i32 %15, %16
  br i1 %17, label %20, label %18, !prof !18

18:                                               ; preds = %13
  %19 = load ptr, ptr %3, align 8, !tbaa !51
  br label %71

20:                                               ; preds = %13
  %21 = shl nsw i32 %15, 1
  store i32 %21, ptr %6, align 4, !tbaa !50
  %22 = icmp slt i32 %15, 0
  br i1 %22, label %23, label %25

23:                                               ; preds = %20
  invoke void @_ZSt28__throw_bad_array_new_lengthB8ne180100v() #15
          to label %24 unwind label %96

24:                                               ; preds = %23
  unreachable

25:                                               ; preds = %20
  %26 = sext i32 %21 to i64
  %27 = shl nuw nsw i64 %26, 2
  %28 = invoke noalias nonnull ptr @_Znwm(i64 noundef %27) #16
          to label %29 unwind label %94

29:                                               ; preds = %25
  %30 = icmp eq i32 %15, 0
  %31 = load ptr, ptr %3, align 8, !tbaa !51
  br i1 %30, label %62, label %32

32:                                               ; preds = %29
  %33 = ptrtoint ptr %31 to i64
  %34 = ptrtoint ptr %28 to i64
  %35 = zext i32 %15 to i64
  %36 = icmp ult i32 %15, 16
  %37 = sub i64 %34, %33
  %38 = icmp ult i64 %37, 64
  %39 = select i1 %36, i1 true, i1 %38
  br i1 %39, label %60, label %40

40:                                               ; preds = %32
  %41 = and i64 %35, 4294967280
  br label %42

42:                                               ; preds = %42, %40
  %43 = phi i64 [ 0, %40 ], [ %56, %42 ]
  %44 = getelementptr inbounds i32, ptr %31, i64 %43
  %45 = load <4 x i32>, ptr %44, align 4, !tbaa !22
  %46 = getelementptr inbounds i32, ptr %44, i64 4
  %47 = load <4 x i32>, ptr %46, align 4, !tbaa !22
  %48 = getelementptr inbounds i32, ptr %44, i64 8
  %49 = load <4 x i32>, ptr %48, align 4, !tbaa !22
  %50 = getelementptr inbounds i32, ptr %44, i64 12
  %51 = load <4 x i32>, ptr %50, align 4, !tbaa !22
  %52 = getelementptr inbounds i32, ptr %28, i64 %43
  store <4 x i32> %45, ptr %52, align 4, !tbaa !22
  %53 = getelementptr inbounds i32, ptr %52, i64 4
  store <4 x i32> %47, ptr %53, align 4, !tbaa !22
  %54 = getelementptr inbounds i32, ptr %52, i64 8
  store <4 x i32> %49, ptr %54, align 4, !tbaa !22
  %55 = getelementptr inbounds i32, ptr %52, i64 12
  store <4 x i32> %51, ptr %55, align 4, !tbaa !22
  %56 = add nuw i64 %43, 16
  %57 = icmp eq i64 %56, %41
  br i1 %57, label %58, label %42, !llvm.loop !108

58:                                               ; preds = %42
  %59 = icmp eq i64 %41, %35
  br i1 %59, label %62, label %60

60:                                               ; preds = %32, %58
  %61 = phi i64 [ 0, %32 ], [ %41, %58 ]
  br label %64

62:                                               ; preds = %64, %58, %29
  call void @_ZdlPv(ptr noundef %31) #18
  store ptr %28, ptr %3, align 8, !tbaa !51
  %63 = load i32, ptr %5, align 8, !tbaa !48
  br label %71

64:                                               ; preds = %60, %64
  %65 = phi i64 [ %69, %64 ], [ %61, %60 ]
  %66 = getelementptr inbounds i32, ptr %31, i64 %65
  %67 = load i32, ptr %66, align 4, !tbaa !22
  %68 = getelementptr inbounds i32, ptr %28, i64 %65
  store i32 %67, ptr %68, align 4, !tbaa !22
  %69 = add nuw nsw i64 %65, 1
  %70 = icmp eq i64 %69, %35
  br i1 %70, label %62, label %64, !llvm.loop !109

71:                                               ; preds = %62, %18
  %72 = phi i32 [ %15, %18 ], [ %63, %62 ]
  %73 = phi ptr [ %19, %18 ], [ %28, %62 ]
  %74 = add nsw i32 %72, 1
  store i32 %74, ptr %5, align 8, !tbaa !48
  %75 = sext i32 %72 to i64
  %76 = getelementptr inbounds i32, ptr %73, i64 %75
  store i32 %14, ptr %76, align 4, !tbaa !22
  call void asm sideeffect "", "=*r|m,*0,~{memory}"(ptr nonnull elementtype(%class.STLVector) %3, ptr nonnull elementtype(%class.STLVector) %3) #17, !srcloc !24
  %77 = add nuw nsw i32 %14, 1
  %78 = icmp eq i32 %77, %11
  br i1 %78, label %79, label %13, !llvm.loop !56

79:                                               ; preds = %71, %1
  %80 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 5
  %81 = load i32, ptr %80, align 4, !tbaa !71
  %82 = getelementptr inbounds %"class.benchmark::State", ptr %0, i64 0, i32 2
  %83 = load i64, ptr %82, align 8
  invoke void @_ZN9benchmark5State16StartKeepRunningEv(ptr noundef nonnull %0)
          to label %84 unwind label %98

84:                                               ; preds = %79
  %85 = icmp ne i32 %81, 0
  %86 = icmp eq i64 %83, 0
  %87 = select i1 %85, i1 true, i1 %86
  br i1 %87, label %88, label %100, !prof !18

88:                                               ; preds = %117, %84
  invoke void @_ZN9benchmark5State17FinishKeepRunningEv(ptr noundef nonnull %0)
          to label %89 unwind label %98

89:                                               ; preds = %88
  %90 = load ptr, ptr %3, align 8, !tbaa !51
  %91 = icmp eq ptr %90, null
  br i1 %91, label %93, label %92

92:                                               ; preds = %89
  call void @_ZdlPv(ptr noundef nonnull %90) #18
  br label %93

93:                                               ; preds = %89, %92
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #17
  ret void

94:                                               ; preds = %25
  %95 = landingpad { ptr, i32 }
          cleanup
  br label %121

96:                                               ; preds = %23
  %97 = landingpad { ptr, i32 }
          cleanup
  br label %121

98:                                               ; preds = %88, %79
  %99 = landingpad { ptr, i32 }
          cleanup
  br label %121

100:                                              ; preds = %84, %117
  %101 = phi i64 [ %119, %117 ], [ %83, %84 ]
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #17
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #17
  store i64 0, ptr %2, align 8, !tbaa !38
  %102 = load ptr, ptr %3, align 8, !tbaa !51
  %103 = load i32, ptr %5, align 8, !tbaa !48
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, ptr %102, i64 %104
  %106 = icmp eq i32 %103, 0
  br i1 %106, label %117, label %109

107:                                              ; preds = %109
  %108 = load i64, ptr %2, align 8, !tbaa !38
  br label %117

109:                                              ; preds = %100, %109
  %110 = phi ptr [ %115, %109 ], [ %102, %100 ]
  %111 = load i32, ptr %110, align 4, !tbaa !22
  %112 = sext i32 %111 to i64
  %113 = load i64, ptr %2, align 8, !tbaa !38
  %114 = add nsw i64 %113, %112
  store i64 %114, ptr %2, align 8, !tbaa !38
  call void asm sideeffect "", "=*r|m,0,~{memory}"(ptr nonnull elementtype(i64) %2, i64 %114) #17, !srcloc !24
  %115 = getelementptr inbounds i32, ptr %110, i64 1
  %116 = icmp eq ptr %115, %105
  br i1 %116, label %107, label %109

117:                                              ; preds = %107, %100
  %118 = phi i64 [ %108, %107 ], [ 0, %100 ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #17
  store i64 %118, ptr %4, align 8, !tbaa !38
  call void asm sideeffect "", "=*r|m,0,~{memory}"(ptr nonnull elementtype(i64) %4, i64 %118) #17, !srcloc !93
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #17
  %119 = add nsw i64 %101, -1
  %120 = icmp eq i64 %119, 0
  br i1 %120, label %88, label %100, !prof !18

121:                                              ; preds = %94, %96, %98
  %122 = phi { ptr, i32 } [ %99, %98 ], [ %95, %94 ], [ %97, %96 ]
  %123 = load ptr, ptr %3, align 8, !tbaa !51
  %124 = icmp eq ptr %123, null
  br i1 %124, label %126, label %125

125:                                              ; preds = %121
  call void @_ZdlPv(ptr noundef nonnull %123) #18
  br label %126

126:                                              ; preds = %121, %125
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #17
  resume { ptr, i32 } %122
}

; Function Attrs: mustprogress norecurse ssp uwtable(sync)
define i32 @main(i32 noundef %0, ptr noundef %1) local_unnamed_addr #6 {
  %3 = alloca i32, align 4
  %4 = alloca [10 x i8], align 1
  %5 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4, !tbaa !22
  call void @llvm.lifetime.start.p0(i64 10, ptr nonnull %4) #17
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(10) %4, ptr noundef nonnull align 1 dereferenceable(10) @__const.main.arg0_default, i64 10, i1 false)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5) #17
  store ptr %4, ptr %5, align 8, !tbaa !20
  %6 = icmp eq ptr %1, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  store i32 1, ptr %3, align 4, !tbaa !22
  br label %8

8:                                                ; preds = %7, %2
  %9 = phi ptr [ %1, %2 ], [ %5, %7 ]
  call void @_ZN9benchmark10InitializeEPiPPcPFvvE(ptr noundef nonnull %3, ptr noundef nonnull %9, ptr noundef nonnull @_ZN9benchmark16PrintDefaultHelpEv)
  %10 = load i32, ptr %3, align 4, !tbaa !22
  %11 = call zeroext i1 @_ZN9benchmark27ReportUnrecognizedArgumentsEiPPc(i32 noundef %10, ptr noundef nonnull %9)
  br i1 %11, label %14, label %12

12:                                               ; preds = %8
  %13 = call i64 @_ZN9benchmark22RunSpecifiedBenchmarksEv()
  call void @_ZN9benchmark8ShutdownEv()
  br label %14

14:                                               ; preds = %8, %12
  %15 = phi i32 [ 0, %12 ], [ 1, %8 ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5) #17
  call void @llvm.lifetime.end.p0(i64 10, ptr nonnull %4) #17
  ret i32 %15
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #7

declare void @_ZN9benchmark10InitializeEPiPPcPFvvE(ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #0

declare void @_ZN9benchmark16PrintDefaultHelpEv() #0

declare zeroext i1 @_ZN9benchmark27ReportUnrecognizedArgumentsEiPPc(i32 noundef, ptr noundef) local_unnamed_addr #0

declare i64 @_ZN9benchmark22RunSpecifiedBenchmarksEv() local_unnamed_addr #0

declare void @_ZN9benchmark8ShutdownEv() local_unnamed_addr #0

; Function Attrs: mustprogress noreturn ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne180100Ev(ptr noundef %0) local_unnamed_addr #8 align 2 {
  tail call void @_ZNSt3__120__throw_length_errorB8ne180100EPKc(ptr noundef nonnull @.str.26) #15
  unreachable
}

; Function Attrs: inlinehint mustprogress noreturn ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__120__throw_length_errorB8ne180100EPKc(ptr noundef %0) local_unnamed_addr #9 personality ptr @__gxx_personality_v0 {
  %2 = tail call ptr @__cxa_allocate_exception(i64 16) #17
  %3 = invoke ptr @_ZNSt12length_errorC1B8ne180100EPKc(ptr noundef %2, ptr noundef %0)
          to label %4 unwind label %5

4:                                                ; preds = %1
  tail call void @__cxa_throw(ptr %2, ptr nonnull @_ZTISt12length_error, ptr nonnull @_ZNSt12length_errorD1Ev) #15
  unreachable

5:                                                ; preds = %1
  %6 = landingpad { ptr, i32 }
          cleanup
  tail call void @__cxa_free_exception(ptr %2) #17
  resume { ptr, i32 } %6
}

declare ptr @__cxa_allocate_exception(i64) local_unnamed_addr

; Function Attrs: ssp uwtable(sync)
define linkonce_odr hidden ptr @_ZNSt12length_errorC1B8ne180100EPKc(ptr noundef returned %0, ptr noundef %1) unnamed_addr #3 align 2 {
  %3 = tail call ptr @_ZNSt11logic_errorC2EPKc(ptr noundef %0, ptr noundef %1)
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVSt12length_error, i64 0, inrange i32 0, i64 2), ptr %0, align 8, !tbaa !29
  ret ptr %0
}

declare void @__cxa_free_exception(ptr) local_unnamed_addr

; Function Attrs: nounwind
declare ptr @_ZNSt12length_errorD1Ev(ptr noundef returned) unnamed_addr #10

declare void @__cxa_throw(ptr, ptr, ptr) local_unnamed_addr

declare ptr @_ZNSt11logic_errorC2EPKc(ptr noundef returned, ptr noundef) unnamed_addr #0

; Function Attrs: nounwind
declare void @_ZNSt12length_errorD0Ev(ptr noundef) unnamed_addr #10

; Function Attrs: nounwind
declare ptr @_ZNKSt11logic_error4whatEv(ptr noundef) unnamed_addr #10

; Function Attrs: inlinehint mustprogress noreturn ssp uwtable(sync)
define linkonce_odr hidden void @_ZSt28__throw_bad_array_new_lengthB8ne180100v() local_unnamed_addr #9 {
  %1 = tail call ptr @__cxa_allocate_exception(i64 8) #17
  %2 = tail call ptr @_ZNSt20bad_array_new_lengthC1Ev(ptr noundef %1) #17
  tail call void @__cxa_throw(ptr %1, ptr nonnull @_ZTISt20bad_array_new_length, ptr nonnull @_ZNSt20bad_array_new_lengthD1Ev) #15
  unreachable
}

; Function Attrs: nounwind
declare ptr @_ZNSt20bad_array_new_lengthC1Ev(ptr noundef returned) unnamed_addr #10

; Function Attrs: nounwind
declare ptr @_ZNSt20bad_array_new_lengthD1Ev(ptr noundef returned) unnamed_addr #10

; Function Attrs: noinline noreturn nounwind ssp uwtable(sync)
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) local_unnamed_addr #11 {
  %2 = tail call ptr @__cxa_begin_catch(ptr %0) #17
  tail call void @_ZSt9terminatev() #19
  unreachable
}

declare ptr @__cxa_begin_catch(ptr) local_unnamed_addr

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: nounwind ssp uwtable(sync)
define linkonce_odr ptr @_ZN14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEED1Ev(ptr noundef returned %0) unnamed_addr #12 align 2 personality ptr @__gxx_personality_v0 {
  %2 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 8
  %3 = load i64, ptr %2, align 8, !tbaa !34
  %4 = getelementptr inbounds %class.ConstantVector, ptr %0, i64 0, i32 3
  %5 = load i64, ptr %4, align 8, !tbaa !19
  %6 = icmp ugt i64 %3, %5
  br i1 %6, label %20, label %7

7:                                                ; preds = %1, %16
  %8 = phi i64 [ %17, %16 ], [ %5, %1 ]
  %9 = phi i64 [ %18, %16 ], [ %3, %1 ]
  %10 = load ptr, ptr %0, align 8, !tbaa !17
  %11 = getelementptr inbounds ptr, ptr %10, i64 %9
  %12 = load ptr, ptr %11, align 8, !tbaa !20
  %13 = icmp eq ptr %12, null
  br i1 %13, label %16, label %14

14:                                               ; preds = %7
  tail call void @_ZdlPv(ptr noundef nonnull %12) #18
  %15 = load i64, ptr %4, align 8, !tbaa !19
  br label %16

16:                                               ; preds = %14, %7
  %17 = phi i64 [ %8, %7 ], [ %15, %14 ]
  %18 = add i64 %9, 1
  %19 = icmp ugt i64 %18, %17
  br i1 %19, label %20, label %7, !llvm.loop !92

20:                                               ; preds = %16, %1
  %21 = load ptr, ptr %0, align 8, !tbaa !17
  tail call void @_ZdlPv(ptr noundef %21) #18
  ret ptr %0
}

declare void @_ZN9benchmark5State16StartKeepRunningEv(ptr noundef) local_unnamed_addr #0

declare void @_ZN9benchmark5State17FinishKeepRunningEv(ptr noundef) local_unnamed_addr #0

declare ptr @_ZN9benchmark8internal9BenchmarkC2ERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE(ptr noundef returned, ptr noundef nonnull align 8 dereferenceable(24)) unnamed_addr #0

declare void @_ZN9benchmark5State11PauseTimingEv(ptr noundef) local_unnamed_addr #0

declare void @_ZN9benchmark5State12ResumeTimingEv(ptr noundef) local_unnamed_addr #0

; Function Attrs: ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB8ne180100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %1, i64 noundef %2) local_unnamed_addr #3 personality ptr @__gxx_personality_v0 {
  %4 = alloca %"class.std::__1::locale", align 8
  %5 = alloca %"class.std::__1::basic_ostream<char>::sentry", align 8
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %5) #17
  %6 = invoke ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_(ptr noundef nonnull %5, ptr noundef nonnull align 8 dereferenceable(8) %0)
          to label %7 unwind label %55

7:                                                ; preds = %3
  %8 = load i8, ptr %5, align 8, !tbaa !110, !range !112, !noundef !41
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %61, label %10

10:                                               ; preds = %7
  %11 = load ptr, ptr %0, align 8, !tbaa !29
  %12 = getelementptr i8, ptr %11, i64 -24
  %13 = load i64, ptr %12, align 8
  %14 = getelementptr inbounds i8, ptr %0, i64 %13
  %15 = getelementptr inbounds %"class.std::__1::ios_base", ptr %14, i64 0, i32 6
  %16 = load ptr, ptr %15, align 8, !tbaa !113
  %17 = getelementptr inbounds %"class.std::__1::ios_base", ptr %14, i64 0, i32 1
  %18 = load i32, ptr %17, align 8, !tbaa !115
  %19 = getelementptr inbounds %"class.std::__1::basic_ios", ptr %14, i64 0, i32 2
  %20 = load i32, ptr %19, align 8, !tbaa !116
  %21 = icmp eq i32 %20, -1
  br i1 %21, label %22, label %36

22:                                               ; preds = %10
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #17
  invoke void @_ZNKSt3__18ios_base6getlocEv(ptr nonnull sret(%"class.std::__1::locale") align 8 %4, ptr noundef nonnull %14)
          to label %23 unwind label %59

23:                                               ; preds = %22
  %24 = invoke ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr noundef nonnull %4, ptr noundef nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
          to label %25 unwind label %30

25:                                               ; preds = %23
  %26 = load ptr, ptr %24, align 8, !tbaa !29
  %27 = getelementptr inbounds ptr, ptr %26, i64 7
  %28 = load ptr, ptr %27, align 8
  %29 = invoke signext i8 %28(ptr noundef nonnull %24, i8 noundef signext 32)
          to label %33 unwind label %30

30:                                               ; preds = %25, %23
  %31 = landingpad { ptr, i32 }
          catch ptr null
  %32 = call ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull %4) #17
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #17
  br label %63

33:                                               ; preds = %25
  %34 = call ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull %4) #17
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #17
  %35 = sext i8 %29 to i32
  store i32 %35, ptr %19, align 8, !tbaa !116
  br label %36

36:                                               ; preds = %33, %10
  %37 = phi i32 [ %35, %33 ], [ %20, %10 ]
  %38 = trunc i32 %37 to i8
  %39 = and i32 %18, 176
  %40 = icmp eq i32 %39, 32
  %41 = getelementptr inbounds i8, ptr %1, i64 %2
  %42 = select i1 %40, ptr %41, ptr %1
  %43 = ptrtoint ptr %16 to i64
  %44 = invoke i64 @_ZNSt3__116__pad_and_outputB8ne180100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_(i64 %43, ptr noundef %1, ptr noundef %42, ptr noundef %41, ptr noundef nonnull align 8 dereferenceable(136) %14, i8 noundef signext %38)
          to label %45 unwind label %59

45:                                               ; preds = %36
  %46 = icmp eq i64 %44, 0
  br i1 %46, label %47, label %61

47:                                               ; preds = %45
  %48 = load ptr, ptr %0, align 8, !tbaa !29
  %49 = getelementptr i8, ptr %48, i64 -24
  %50 = load i64, ptr %49, align 8
  %51 = getelementptr inbounds i8, ptr %0, i64 %50
  %52 = getelementptr inbounds %"class.std::__1::ios_base", ptr %51, i64 0, i32 4
  %53 = load i32, ptr %52, align 8, !tbaa !118
  %54 = or i32 %53, 5
  invoke void @_ZNSt3__18ios_base5clearEj(ptr noundef nonnull %51, i32 noundef %54)
          to label %61 unwind label %57

55:                                               ; preds = %3
  %56 = landingpad { ptr, i32 }
          catch ptr null
  br label %66

57:                                               ; preds = %47
  %58 = landingpad { ptr, i32 }
          catch ptr null
  br label %63

59:                                               ; preds = %22, %36
  %60 = landingpad { ptr, i32 }
          catch ptr null
  br label %63

61:                                               ; preds = %47, %45, %7
  %62 = call ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(ptr noundef nonnull %5) #17
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %5) #17
  br label %75

63:                                               ; preds = %59, %30, %57
  %64 = phi { ptr, i32 } [ %58, %57 ], [ %60, %59 ], [ %31, %30 ]
  %65 = call ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(ptr noundef nonnull %5) #17
  br label %66

66:                                               ; preds = %63, %55
  %67 = phi { ptr, i32 } [ %64, %63 ], [ %56, %55 ]
  %68 = extractvalue { ptr, i32 } %67, 0
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %5) #17
  %69 = call ptr @__cxa_begin_catch(ptr %68) #17
  %70 = load ptr, ptr %0, align 8, !tbaa !29
  %71 = getelementptr i8, ptr %70, i64 -24
  %72 = load i64, ptr %71, align 8
  %73 = getelementptr inbounds i8, ptr %0, i64 %72
  invoke void @_ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv(ptr noundef nonnull %73)
          to label %74 unwind label %76

74:                                               ; preds = %66
  call void @__cxa_end_catch()
  br label %75

75:                                               ; preds = %74, %61
  ret ptr %0

76:                                               ; preds = %66
  %77 = landingpad { ptr, i32 }
          cleanup
  invoke void @__cxa_end_catch()
          to label %78 unwind label %79

78:                                               ; preds = %76
  resume { ptr, i32 } %77

79:                                               ; preds = %76
  %80 = landingpad { ptr, i32 }
          catch ptr null
  %81 = extractvalue { ptr, i32 } %80, 0
  call void @__clang_call_terminate(ptr %81) #19
  unreachable
}

declare ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_(ptr noundef returned, ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #0

; Function Attrs: ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__116__pad_and_outputB8ne180100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_(i64 %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef nonnull align 8 dereferenceable(136) %4, i8 noundef signext %5) local_unnamed_addr #3 personality ptr @__gxx_personality_v0 {
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = inttoptr i64 %0 to ptr
  %9 = icmp eq i64 %0, 0
  br i1 %9, label %85, label %10

10:                                               ; preds = %6
  %11 = ptrtoint ptr %3 to i64
  %12 = ptrtoint ptr %1 to i64
  %13 = sub i64 %11, %12
  %14 = getelementptr inbounds %"class.std::__1::ios_base", ptr %4, i64 0, i32 3
  %15 = load i64, ptr %14, align 8, !tbaa !119
  %16 = icmp sgt i64 %15, %13
  %17 = sub nsw i64 %15, %13
  %18 = select i1 %16, i64 %17, i64 0
  %19 = ptrtoint ptr %2 to i64
  %20 = sub i64 %19, %12
  %21 = icmp sgt i64 %20, 0
  br i1 %21, label %22, label %28

22:                                               ; preds = %10
  %23 = load ptr, ptr %8, align 8, !tbaa !29
  %24 = getelementptr inbounds ptr, ptr %23, i64 12
  %25 = load ptr, ptr %24, align 8
  %26 = tail call i64 %25(ptr noundef nonnull %8, ptr noundef %1, i64 noundef %20)
  %27 = icmp eq i64 %26, %20
  br i1 %27, label %28, label %85

28:                                               ; preds = %22, %10
  %29 = icmp sgt i64 %18, 0
  br i1 %29, label %30, label %75

30:                                               ; preds = %28
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %7) #17
  %31 = icmp ugt i64 %18, 9223372036854775799
  br i1 %31, label %32, label %33

32:                                               ; preds = %30
  call void @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB8ne180100Ev(ptr noundef nonnull %7) #15
  unreachable

33:                                               ; preds = %30
  %34 = icmp ult i64 %18, 23
  br i1 %34, label %46, label %35

35:                                               ; preds = %33
  %36 = and i64 %18, -8
  %37 = add nuw nsw i64 %36, 8
  %38 = or i64 %18, 7
  %39 = icmp eq i64 %38, 23
  %40 = select i1 %39, i64 %37, i64 %38
  %41 = add nuw i64 %40, 1
  %42 = tail call noalias nonnull ptr @_Znwm(i64 noundef %41) #16
  store ptr %42, ptr %7, align 8, !tbaa !90
  %43 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", ptr %7, i64 0, i32 2
  %44 = or i64 %41, -9223372036854775808
  store i64 %44, ptr %43, align 8
  %45 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", ptr %7, i64 0, i32 1
  store i64 %18, ptr %45, align 8, !tbaa !90
  br label %49

46:                                               ; preds = %33
  %47 = trunc i64 %18 to i8
  %48 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %7, i64 0, i32 2
  store i8 %47, ptr %48, align 1
  br label %49

49:                                               ; preds = %35, %46
  %50 = phi ptr [ %42, %35 ], [ %7, %46 ]
  call void @llvm.memset.p0.i64(ptr nonnull align 1 %50, i8 %5, i64 %18, i1 false), !tbaa !90
  %51 = getelementptr inbounds i8, ptr %50, i64 %18
  store i8 0, ptr %51, align 1, !tbaa !90
  %52 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %7, i64 0, i32 2
  %53 = load i8, ptr %52, align 1
  %54 = icmp slt i8 %53, 0
  %55 = load ptr, ptr %7, align 8
  %56 = select i1 %54, ptr %55, ptr %7
  %57 = load ptr, ptr %8, align 8, !tbaa !29
  %58 = getelementptr inbounds ptr, ptr %57, i64 12
  %59 = load ptr, ptr %58, align 8
  %60 = invoke i64 %59(ptr noundef nonnull %8, ptr noundef %56, i64 noundef %18)
          to label %61 unwind label %68

61:                                               ; preds = %49
  %62 = icmp eq i64 %60, %18
  %63 = load i8, ptr %52, align 1
  %64 = icmp slt i8 %63, 0
  br i1 %64, label %65, label %67

65:                                               ; preds = %61
  %66 = load ptr, ptr %7, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %66) #18
  br label %67

67:                                               ; preds = %61, %65
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %7) #17
  br i1 %62, label %75, label %85

68:                                               ; preds = %49
  %69 = landingpad { ptr, i32 }
          cleanup
  %70 = load i8, ptr %52, align 1
  %71 = icmp slt i8 %70, 0
  br i1 %71, label %72, label %74

72:                                               ; preds = %68
  %73 = load ptr, ptr %7, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %73) #18
  br label %74

74:                                               ; preds = %68, %72
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %7) #17
  resume { ptr, i32 } %69

75:                                               ; preds = %67, %28
  %76 = sub i64 %11, %19
  %77 = icmp sgt i64 %76, 0
  br i1 %77, label %78, label %84

78:                                               ; preds = %75
  %79 = load ptr, ptr %8, align 8, !tbaa !29
  %80 = getelementptr inbounds ptr, ptr %79, i64 12
  %81 = load ptr, ptr %80, align 8
  %82 = call i64 %81(ptr noundef nonnull %8, ptr noundef %2, i64 noundef %76)
  %83 = icmp eq i64 %82, %76
  br i1 %83, label %84, label %85

84:                                               ; preds = %78, %75
  store i64 0, ptr %14, align 8, !tbaa !119
  br label %85

85:                                               ; preds = %84, %67, %22, %78, %6
  %86 = phi i64 [ 0, %6 ], [ %0, %84 ], [ 0, %67 ], [ 0, %22 ], [ 0, %78 ]
  ret i64 %86
}

; Function Attrs: nounwind
declare ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(ptr noundef returned) unnamed_addr #10

declare void @_ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv(ptr noundef) local_unnamed_addr #0

declare void @__cxa_end_catch() local_unnamed_addr

declare void @_ZNKSt3__18ios_base6getlocEv(ptr sret(%"class.std::__1::locale") align 8, ptr noundef) local_unnamed_addr #0

; Function Attrs: nounwind
declare ptr @_ZNSt3__16localeD1Ev(ptr noundef returned) unnamed_addr #10

declare ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr noundef, ptr noundef nonnull align 8 dereferenceable(12)) local_unnamed_addr #0

declare void @_ZNSt3__18ios_base5clearEj(ptr noundef, i32 noundef) local_unnamed_addr #0

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef, i8 noundef signext) local_unnamed_addr #0

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(ptr noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #13

; Function Attrs: ssp uwtable(sync)
define internal void @_GLOBAL__sub_I_benchmark_vectors.cpp() #3 section "__TEXT,__StaticInit,regular,pure_instructions" personality ptr @__gxx_personality_v0 {
  %1 = alloca %"class.std::__1::basic_string", align 8
  %2 = alloca %"class.std::__1::basic_string", align 8
  %3 = alloca %"class.std::__1::basic_string", align 8
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca %"class.std::__1::basic_string", align 8
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = alloca %"class.std::__1::basic_string", align 8
  %9 = alloca %"class.std::__1::basic_string", align 8
  %10 = tail call i32 @_ZN9benchmark8internal17InitializeStreamsEv()
  %11 = tail call noalias nonnull dereferenceable(224) ptr @_Znwm(i64 noundef 224) #16
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %9) #17
  %12 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %9, i64 0, i32 2
  store i8 21, ptr %12, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(21) %9, ptr noundef nonnull align 1 dereferenceable(21) @.str.9, i64 21, i1 false)
  %13 = getelementptr inbounds i8, ptr %9, i64 21
  store i8 0, ptr %13, align 1, !tbaa !90
  %14 = invoke ptr @_ZN9benchmark8internal9BenchmarkC2ERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE(ptr noundef nonnull %11, ptr noundef nonnull align 8 dereferenceable(24) %9)
          to label %15 unwind label %29

15:                                               ; preds = %0
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVN9benchmark8internal17FunctionBenchmarkE, i64 0, inrange i32 0, i64 2), ptr %11, align 8, !tbaa !29
  %16 = getelementptr inbounds %"class.benchmark::internal::FunctionBenchmark", ptr %11, i64 0, i32 1
  store ptr @_ZL21BM_ConstantVectorPushRN9benchmark5StateE, ptr %16, align 8, !tbaa !120
  %17 = invoke ptr @_ZN9benchmark8internal25RegisterBenchmarkInternalEPNS0_9BenchmarkE(ptr noundef nonnull %11)
          to label %18 unwind label %29

18:                                               ; preds = %15
  %19 = invoke ptr @_ZN9benchmark8internal9Benchmark10IterationsEx(ptr noundef %17, i64 noundef 30)
          to label %20 unwind label %29

20:                                               ; preds = %18
  %21 = invoke ptr @_ZN9benchmark8internal9Benchmark15RangeMultiplierEi(ptr noundef %19, i32 noundef 10)
          to label %22 unwind label %29

22:                                               ; preds = %20
  %23 = invoke ptr @_ZN9benchmark8internal9Benchmark5RangeExx(ptr noundef %21, i64 noundef 10, i64 noundef 100000000)
          to label %24 unwind label %29

24:                                               ; preds = %22
  %25 = load i8, ptr %12, align 1
  %26 = icmp slt i8 %25, 0
  br i1 %26, label %27, label %42

27:                                               ; preds = %24
  %28 = load ptr, ptr %9, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %28) #18
  br label %42

29:                                               ; preds = %22, %20, %18, %15, %0
  %30 = phi i1 [ false, %22 ], [ false, %20 ], [ false, %18 ], [ false, %15 ], [ true, %0 ]
  %31 = landingpad { ptr, i32 }
          cleanup
  %32 = load i8, ptr %12, align 1
  %33 = icmp slt i8 %32, 0
  br i1 %33, label %34, label %36

34:                                               ; preds = %29
  %35 = load ptr, ptr %9, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %35) #18
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %9) #17
  br i1 %30, label %37, label %40

36:                                               ; preds = %29
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %9) #17
  br i1 %30, label %37, label %40

37:                                               ; preds = %34, %36, %273, %275, %246, %248, %219, %221, %192, %194, %157, %165, %167, %124, %132, %134, %91, %99, %101, %66, %68
  %38 = phi ptr [ %43, %68 ], [ %43, %66 ], [ %70, %101 ], [ %70, %99 ], [ %70, %91 ], [ %103, %134 ], [ %103, %132 ], [ %103, %124 ], [ %136, %167 ], [ %136, %165 ], [ %136, %157 ], [ %169, %194 ], [ %169, %192 ], [ %196, %221 ], [ %196, %219 ], [ %223, %248 ], [ %223, %246 ], [ %250, %275 ], [ %250, %273 ], [ %11, %36 ], [ %11, %34 ]
  %39 = phi { ptr, i32 } [ %63, %68 ], [ %63, %66 ], [ %95, %101 ], [ %95, %99 ], [ %92, %91 ], [ %128, %134 ], [ %128, %132 ], [ %125, %124 ], [ %161, %167 ], [ %161, %165 ], [ %158, %157 ], [ %189, %194 ], [ %189, %192 ], [ %216, %221 ], [ %216, %219 ], [ %243, %248 ], [ %243, %246 ], [ %270, %275 ], [ %270, %273 ], [ %31, %36 ], [ %31, %34 ]
  call void @_ZdlPv(ptr noundef nonnull %38) #18
  br label %40

40:                                               ; preds = %37, %273, %275, %246, %248, %219, %221, %192, %194, %165, %167, %132, %134, %99, %101, %66, %68, %34, %36
  %41 = phi { ptr, i32 } [ %31, %36 ], [ %31, %34 ], [ %63, %68 ], [ %63, %66 ], [ %95, %101 ], [ %95, %99 ], [ %128, %134 ], [ %128, %132 ], [ %161, %167 ], [ %161, %165 ], [ %189, %194 ], [ %189, %192 ], [ %216, %221 ], [ %216, %219 ], [ %243, %248 ], [ %243, %246 ], [ %270, %275 ], [ %270, %273 ], [ %39, %37 ]
  resume { ptr, i32 } %41

42:                                               ; preds = %24, %27
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %9) #17
  store ptr %23, ptr @_ZL27benchmark_uniq_2_benchmark_, align 8, !tbaa !20
  %43 = call noalias nonnull dereferenceable(224) ptr @_Znwm(i64 noundef 224) #16
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %8) #17
  %44 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %8, i64 0, i32 2
  store i8 20, ptr %44, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(20) %8, ptr noundef nonnull align 1 dereferenceable(20) @.str.11, i64 20, i1 false)
  %45 = getelementptr inbounds i8, ptr %8, i64 20
  store i8 0, ptr %45, align 4, !tbaa !90
  %46 = invoke ptr @_ZN9benchmark8internal9BenchmarkC2ERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE(ptr noundef nonnull %43, ptr noundef nonnull align 8 dereferenceable(24) %8)
          to label %47 unwind label %61

47:                                               ; preds = %42
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVN9benchmark8internal17FunctionBenchmarkE, i64 0, inrange i32 0, i64 2), ptr %43, align 8, !tbaa !29
  %48 = getelementptr inbounds %"class.benchmark::internal::FunctionBenchmark", ptr %43, i64 0, i32 1
  store ptr @_ZL20BM_ConstantVectorPopRN9benchmark5StateE, ptr %48, align 8, !tbaa !120
  %49 = invoke ptr @_ZN9benchmark8internal25RegisterBenchmarkInternalEPNS0_9BenchmarkE(ptr noundef nonnull %43)
          to label %50 unwind label %61

50:                                               ; preds = %47
  %51 = invoke ptr @_ZN9benchmark8internal9Benchmark10IterationsEx(ptr noundef %49, i64 noundef 30)
          to label %52 unwind label %61

52:                                               ; preds = %50
  %53 = invoke ptr @_ZN9benchmark8internal9Benchmark15RangeMultiplierEi(ptr noundef %51, i32 noundef 10)
          to label %54 unwind label %61

54:                                               ; preds = %52
  %55 = invoke ptr @_ZN9benchmark8internal9Benchmark5RangeExx(ptr noundef %53, i64 noundef 10, i64 noundef 100000000)
          to label %56 unwind label %61

56:                                               ; preds = %54
  %57 = load i8, ptr %44, align 1
  %58 = icmp slt i8 %57, 0
  br i1 %58, label %59, label %69

59:                                               ; preds = %56
  %60 = load ptr, ptr %8, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %60) #18
  br label %69

61:                                               ; preds = %54, %52, %50, %47, %42
  %62 = phi i1 [ false, %54 ], [ false, %52 ], [ false, %50 ], [ false, %47 ], [ true, %42 ]
  %63 = landingpad { ptr, i32 }
          cleanup
  %64 = load i8, ptr %44, align 1
  %65 = icmp slt i8 %64, 0
  br i1 %65, label %66, label %68

66:                                               ; preds = %61
  %67 = load ptr, ptr %8, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %67) #18
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %8) #17
  br i1 %62, label %37, label %40

68:                                               ; preds = %61
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %8) #17
  br i1 %62, label %37, label %40

69:                                               ; preds = %56, %59
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %8) #17
  store ptr %55, ptr @_ZL27benchmark_uniq_3_benchmark_, align 8, !tbaa !20
  %70 = call noalias nonnull dereferenceable(224) ptr @_Znwm(i64 noundef 224) #16
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %7) #17
  %71 = invoke noalias nonnull dereferenceable(32) ptr @_Znwm(i64 noundef 32) #16
          to label %72 unwind label %91

72:                                               ; preds = %69
  store ptr %71, ptr %7, align 8, !tbaa !90
  %73 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", ptr %7, i64 0, i32 1
  store <2 x i64> <i64 28, i64 -9223372036854775776>, ptr %73, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(28) %71, ptr noundef nonnull align 1 dereferenceable(28) @.str.13, i64 28, i1 false)
  %74 = getelementptr inbounds i8, ptr %71, i64 28
  store i8 0, ptr %74, align 1, !tbaa !90
  %75 = invoke ptr @_ZN9benchmark8internal9BenchmarkC2ERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE(ptr noundef nonnull %70, ptr noundef nonnull align 8 dereferenceable(24) %7)
          to label %76 unwind label %93

76:                                               ; preds = %72
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVN9benchmark8internal17FunctionBenchmarkE, i64 0, inrange i32 0, i64 2), ptr %70, align 8, !tbaa !29
  %77 = getelementptr inbounds %"class.benchmark::internal::FunctionBenchmark", ptr %70, i64 0, i32 1
  store ptr @_ZL28BM_ConstantVectorPopNoShrinkRN9benchmark5StateE, ptr %77, align 8, !tbaa !120
  %78 = invoke ptr @_ZN9benchmark8internal25RegisterBenchmarkInternalEPNS0_9BenchmarkE(ptr noundef nonnull %70)
          to label %79 unwind label %93

79:                                               ; preds = %76
  %80 = invoke ptr @_ZN9benchmark8internal9Benchmark10IterationsEx(ptr noundef %78, i64 noundef 30)
          to label %81 unwind label %93

81:                                               ; preds = %79
  %82 = invoke ptr @_ZN9benchmark8internal9Benchmark15RangeMultiplierEi(ptr noundef %80, i32 noundef 10)
          to label %83 unwind label %93

83:                                               ; preds = %81
  %84 = invoke ptr @_ZN9benchmark8internal9Benchmark5RangeExx(ptr noundef %82, i64 noundef 10, i64 noundef 100000000)
          to label %85 unwind label %93

85:                                               ; preds = %83
  %86 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %7, i64 0, i32 2
  %87 = load i8, ptr %86, align 1
  %88 = icmp slt i8 %87, 0
  br i1 %88, label %89, label %102

89:                                               ; preds = %85
  %90 = load ptr, ptr %7, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %90) #18
  br label %102

91:                                               ; preds = %69
  %92 = landingpad { ptr, i32 }
          cleanup
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %7) #17
  br label %37

93:                                               ; preds = %83, %81, %79, %76, %72
  %94 = phi i1 [ false, %83 ], [ false, %81 ], [ false, %79 ], [ false, %76 ], [ true, %72 ]
  %95 = landingpad { ptr, i32 }
          cleanup
  %96 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %7, i64 0, i32 2
  %97 = load i8, ptr %96, align 1
  %98 = icmp slt i8 %97, 0
  br i1 %98, label %99, label %101

99:                                               ; preds = %93
  %100 = load ptr, ptr %7, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %100) #18
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %7) #17
  br i1 %94, label %37, label %40

101:                                              ; preds = %93
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %7) #17
  br i1 %94, label %37, label %40

102:                                              ; preds = %85, %89
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %7) #17
  store ptr %84, ptr @_ZL27benchmark_uniq_4_benchmark_, align 8, !tbaa !20
  %103 = call noalias nonnull dereferenceable(224) ptr @_Znwm(i64 noundef 224) #16
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %6) #17
  %104 = invoke noalias nonnull dereferenceable(25) ptr @_Znwm(i64 noundef 25) #16
          to label %105 unwind label %124

105:                                              ; preds = %102
  store ptr %104, ptr %6, align 8, !tbaa !90
  %106 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", ptr %6, i64 0, i32 1
  store <2 x i64> <i64 23, i64 -9223372036854775783>, ptr %106, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(23) %104, ptr noundef nonnull align 1 dereferenceable(23) @.str.15, i64 23, i1 false)
  %107 = getelementptr inbounds i8, ptr %104, i64 23
  store i8 0, ptr %107, align 1, !tbaa !90
  %108 = invoke ptr @_ZN9benchmark8internal9BenchmarkC2ERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE(ptr noundef nonnull %103, ptr noundef nonnull align 8 dereferenceable(24) %6)
          to label %109 unwind label %126

109:                                              ; preds = %105
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVN9benchmark8internal17FunctionBenchmarkE, i64 0, inrange i32 0, i64 2), ptr %103, align 8, !tbaa !29
  %110 = getelementptr inbounds %"class.benchmark::internal::FunctionBenchmark", ptr %103, i64 0, i32 1
  store ptr @_ZL23BM_ConstantVectorAccessRN9benchmark5StateE, ptr %110, align 8, !tbaa !120
  %111 = invoke ptr @_ZN9benchmark8internal25RegisterBenchmarkInternalEPNS0_9BenchmarkE(ptr noundef nonnull %103)
          to label %112 unwind label %126

112:                                              ; preds = %109
  %113 = invoke ptr @_ZN9benchmark8internal9Benchmark10IterationsEx(ptr noundef %111, i64 noundef 30)
          to label %114 unwind label %126

114:                                              ; preds = %112
  %115 = invoke ptr @_ZN9benchmark8internal9Benchmark15RangeMultiplierEi(ptr noundef %113, i32 noundef 10)
          to label %116 unwind label %126

116:                                              ; preds = %114
  %117 = invoke ptr @_ZN9benchmark8internal9Benchmark5RangeExx(ptr noundef %115, i64 noundef 10, i64 noundef 100000000)
          to label %118 unwind label %126

118:                                              ; preds = %116
  %119 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %6, i64 0, i32 2
  %120 = load i8, ptr %119, align 1
  %121 = icmp slt i8 %120, 0
  br i1 %121, label %122, label %135

122:                                              ; preds = %118
  %123 = load ptr, ptr %6, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %123) #18
  br label %135

124:                                              ; preds = %102
  %125 = landingpad { ptr, i32 }
          cleanup
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %6) #17
  br label %37

126:                                              ; preds = %116, %114, %112, %109, %105
  %127 = phi i1 [ false, %116 ], [ false, %114 ], [ false, %112 ], [ false, %109 ], [ true, %105 ]
  %128 = landingpad { ptr, i32 }
          cleanup
  %129 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %6, i64 0, i32 2
  %130 = load i8, ptr %129, align 1
  %131 = icmp slt i8 %130, 0
  br i1 %131, label %132, label %134

132:                                              ; preds = %126
  %133 = load ptr, ptr %6, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %133) #18
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %6) #17
  br i1 %127, label %37, label %40

134:                                              ; preds = %126
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %6) #17
  br i1 %127, label %37, label %40

135:                                              ; preds = %118, %122
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %6) #17
  store ptr %117, ptr @_ZL27benchmark_uniq_5_benchmark_, align 8, !tbaa !20
  %136 = call noalias nonnull dereferenceable(224) ptr @_Znwm(i64 noundef 224) #16
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %5) #17
  %137 = invoke noalias nonnull dereferenceable(32) ptr @_Znwm(i64 noundef 32) #16
          to label %138 unwind label %157

138:                                              ; preds = %135
  store ptr %137, ptr %5, align 8, !tbaa !90
  %139 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", ptr %5, i64 0, i32 1
  store <2 x i64> <i64 26, i64 -9223372036854775776>, ptr %139, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(26) %137, ptr noundef nonnull align 1 dereferenceable(26) @.str.17, i64 26, i1 false)
  %140 = getelementptr inbounds i8, ptr %137, i64 26
  store i8 0, ptr %140, align 1, !tbaa !90
  %141 = invoke ptr @_ZN9benchmark8internal9BenchmarkC2ERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE(ptr noundef nonnull %136, ptr noundef nonnull align 8 dereferenceable(24) %5)
          to label %142 unwind label %159

142:                                              ; preds = %138
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVN9benchmark8internal17FunctionBenchmarkE, i64 0, inrange i32 0, i64 2), ptr %136, align 8, !tbaa !29
  %143 = getelementptr inbounds %"class.benchmark::internal::FunctionBenchmark", ptr %136, i64 0, i32 1
  store ptr @_ZL26BM_ConstantVectorIterationRN9benchmark5StateE, ptr %143, align 8, !tbaa !120
  %144 = invoke ptr @_ZN9benchmark8internal25RegisterBenchmarkInternalEPNS0_9BenchmarkE(ptr noundef nonnull %136)
          to label %145 unwind label %159

145:                                              ; preds = %142
  %146 = invoke ptr @_ZN9benchmark8internal9Benchmark10IterationsEx(ptr noundef %144, i64 noundef 30)
          to label %147 unwind label %159

147:                                              ; preds = %145
  %148 = invoke ptr @_ZN9benchmark8internal9Benchmark15RangeMultiplierEi(ptr noundef %146, i32 noundef 10)
          to label %149 unwind label %159

149:                                              ; preds = %147
  %150 = invoke ptr @_ZN9benchmark8internal9Benchmark5RangeExx(ptr noundef %148, i64 noundef 10, i64 noundef 100000000)
          to label %151 unwind label %159

151:                                              ; preds = %149
  %152 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %5, i64 0, i32 2
  %153 = load i8, ptr %152, align 1
  %154 = icmp slt i8 %153, 0
  br i1 %154, label %155, label %168

155:                                              ; preds = %151
  %156 = load ptr, ptr %5, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %156) #18
  br label %168

157:                                              ; preds = %135
  %158 = landingpad { ptr, i32 }
          cleanup
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %5) #17
  br label %37

159:                                              ; preds = %149, %147, %145, %142, %138
  %160 = phi i1 [ false, %149 ], [ false, %147 ], [ false, %145 ], [ false, %142 ], [ true, %138 ]
  %161 = landingpad { ptr, i32 }
          cleanup
  %162 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %5, i64 0, i32 2
  %163 = load i8, ptr %162, align 1
  %164 = icmp slt i8 %163, 0
  br i1 %164, label %165, label %167

165:                                              ; preds = %159
  %166 = load ptr, ptr %5, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %166) #18
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %5) #17
  br i1 %160, label %37, label %40

167:                                              ; preds = %159
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %5) #17
  br i1 %160, label %37, label %40

168:                                              ; preds = %151, %155
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %5) #17
  store ptr %150, ptr @_ZL27benchmark_uniq_6_benchmark_, align 8, !tbaa !20
  %169 = call noalias nonnull dereferenceable(224) ptr @_Znwm(i64 noundef 224) #16
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %4) #17
  %170 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %4, i64 0, i32 2
  store i8 13, ptr %170, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(13) %4, ptr noundef nonnull align 1 dereferenceable(13) @.str.19, i64 13, i1 false)
  %171 = getelementptr inbounds i8, ptr %4, i64 13
  store i8 0, ptr %171, align 1, !tbaa !90
  %172 = invoke ptr @_ZN9benchmark8internal9BenchmarkC2ERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE(ptr noundef nonnull %169, ptr noundef nonnull align 8 dereferenceable(24) %4)
          to label %173 unwind label %187

173:                                              ; preds = %168
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVN9benchmark8internal17FunctionBenchmarkE, i64 0, inrange i32 0, i64 2), ptr %169, align 8, !tbaa !29
  %174 = getelementptr inbounds %"class.benchmark::internal::FunctionBenchmark", ptr %169, i64 0, i32 1
  store ptr @_ZL13BM_VectorPushRN9benchmark5StateE, ptr %174, align 8, !tbaa !120
  %175 = invoke ptr @_ZN9benchmark8internal25RegisterBenchmarkInternalEPNS0_9BenchmarkE(ptr noundef nonnull %169)
          to label %176 unwind label %187

176:                                              ; preds = %173
  %177 = invoke ptr @_ZN9benchmark8internal9Benchmark10IterationsEx(ptr noundef %175, i64 noundef 30)
          to label %178 unwind label %187

178:                                              ; preds = %176
  %179 = invoke ptr @_ZN9benchmark8internal9Benchmark15RangeMultiplierEi(ptr noundef %177, i32 noundef 10)
          to label %180 unwind label %187

180:                                              ; preds = %178
  %181 = invoke ptr @_ZN9benchmark8internal9Benchmark5RangeExx(ptr noundef %179, i64 noundef 10, i64 noundef 100000000)
          to label %182 unwind label %187

182:                                              ; preds = %180
  %183 = load i8, ptr %170, align 1
  %184 = icmp slt i8 %183, 0
  br i1 %184, label %185, label %195

185:                                              ; preds = %182
  %186 = load ptr, ptr %4, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %186) #18
  br label %195

187:                                              ; preds = %180, %178, %176, %173, %168
  %188 = phi i1 [ false, %180 ], [ false, %178 ], [ false, %176 ], [ false, %173 ], [ true, %168 ]
  %189 = landingpad { ptr, i32 }
          cleanup
  %190 = load i8, ptr %170, align 1
  %191 = icmp slt i8 %190, 0
  br i1 %191, label %192, label %194

192:                                              ; preds = %187
  %193 = load ptr, ptr %4, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %193) #18
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %4) #17
  br i1 %188, label %37, label %40

194:                                              ; preds = %187
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %4) #17
  br i1 %188, label %37, label %40

195:                                              ; preds = %182, %185
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %4) #17
  store ptr %181, ptr @_ZL27benchmark_uniq_7_benchmark_, align 8, !tbaa !20
  %196 = call noalias nonnull dereferenceable(224) ptr @_Znwm(i64 noundef 224) #16
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %3) #17
  %197 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %3, i64 0, i32 2
  store i8 12, ptr %197, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(12) %3, ptr noundef nonnull align 1 dereferenceable(12) @.str.21, i64 12, i1 false)
  %198 = getelementptr inbounds i8, ptr %3, i64 12
  store i8 0, ptr %198, align 4, !tbaa !90
  %199 = invoke ptr @_ZN9benchmark8internal9BenchmarkC2ERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE(ptr noundef nonnull %196, ptr noundef nonnull align 8 dereferenceable(24) %3)
          to label %200 unwind label %214

200:                                              ; preds = %195
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVN9benchmark8internal17FunctionBenchmarkE, i64 0, inrange i32 0, i64 2), ptr %196, align 8, !tbaa !29
  %201 = getelementptr inbounds %"class.benchmark::internal::FunctionBenchmark", ptr %196, i64 0, i32 1
  store ptr @_ZL12BM_VectorPopRN9benchmark5StateE, ptr %201, align 8, !tbaa !120
  %202 = invoke ptr @_ZN9benchmark8internal25RegisterBenchmarkInternalEPNS0_9BenchmarkE(ptr noundef nonnull %196)
          to label %203 unwind label %214

203:                                              ; preds = %200
  %204 = invoke ptr @_ZN9benchmark8internal9Benchmark10IterationsEx(ptr noundef %202, i64 noundef 30)
          to label %205 unwind label %214

205:                                              ; preds = %203
  %206 = invoke ptr @_ZN9benchmark8internal9Benchmark15RangeMultiplierEi(ptr noundef %204, i32 noundef 10)
          to label %207 unwind label %214

207:                                              ; preds = %205
  %208 = invoke ptr @_ZN9benchmark8internal9Benchmark5RangeExx(ptr noundef %206, i64 noundef 10, i64 noundef 100000000)
          to label %209 unwind label %214

209:                                              ; preds = %207
  %210 = load i8, ptr %197, align 1
  %211 = icmp slt i8 %210, 0
  br i1 %211, label %212, label %222

212:                                              ; preds = %209
  %213 = load ptr, ptr %3, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %213) #18
  br label %222

214:                                              ; preds = %207, %205, %203, %200, %195
  %215 = phi i1 [ false, %207 ], [ false, %205 ], [ false, %203 ], [ false, %200 ], [ true, %195 ]
  %216 = landingpad { ptr, i32 }
          cleanup
  %217 = load i8, ptr %197, align 1
  %218 = icmp slt i8 %217, 0
  br i1 %218, label %219, label %221

219:                                              ; preds = %214
  %220 = load ptr, ptr %3, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %220) #18
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #17
  br i1 %215, label %37, label %40

221:                                              ; preds = %214
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #17
  br i1 %215, label %37, label %40

222:                                              ; preds = %209, %212
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #17
  store ptr %208, ptr @_ZL27benchmark_uniq_8_benchmark_, align 8, !tbaa !20
  %223 = call noalias nonnull dereferenceable(224) ptr @_Znwm(i64 noundef 224) #16
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %2) #17
  %224 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %2, i64 0, i32 2
  store i8 15, ptr %224, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(15) %2, ptr noundef nonnull align 1 dereferenceable(15) @.str.23, i64 15, i1 false)
  %225 = getelementptr inbounds i8, ptr %2, i64 15
  store i8 0, ptr %225, align 1, !tbaa !90
  %226 = invoke ptr @_ZN9benchmark8internal9BenchmarkC2ERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE(ptr noundef nonnull %223, ptr noundef nonnull align 8 dereferenceable(24) %2)
          to label %227 unwind label %241

227:                                              ; preds = %222
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVN9benchmark8internal17FunctionBenchmarkE, i64 0, inrange i32 0, i64 2), ptr %223, align 8, !tbaa !29
  %228 = getelementptr inbounds %"class.benchmark::internal::FunctionBenchmark", ptr %223, i64 0, i32 1
  store ptr @_ZL15BM_VectorAccessRN9benchmark5StateE, ptr %228, align 8, !tbaa !120
  %229 = invoke ptr @_ZN9benchmark8internal25RegisterBenchmarkInternalEPNS0_9BenchmarkE(ptr noundef nonnull %223)
          to label %230 unwind label %241

230:                                              ; preds = %227
  %231 = invoke ptr @_ZN9benchmark8internal9Benchmark10IterationsEx(ptr noundef %229, i64 noundef 30)
          to label %232 unwind label %241

232:                                              ; preds = %230
  %233 = invoke ptr @_ZN9benchmark8internal9Benchmark15RangeMultiplierEi(ptr noundef %231, i32 noundef 10)
          to label %234 unwind label %241

234:                                              ; preds = %232
  %235 = invoke ptr @_ZN9benchmark8internal9Benchmark5RangeExx(ptr noundef %233, i64 noundef 10, i64 noundef 100000000)
          to label %236 unwind label %241

236:                                              ; preds = %234
  %237 = load i8, ptr %224, align 1
  %238 = icmp slt i8 %237, 0
  br i1 %238, label %239, label %249

239:                                              ; preds = %236
  %240 = load ptr, ptr %2, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %240) #18
  br label %249

241:                                              ; preds = %234, %232, %230, %227, %222
  %242 = phi i1 [ false, %234 ], [ false, %232 ], [ false, %230 ], [ false, %227 ], [ true, %222 ]
  %243 = landingpad { ptr, i32 }
          cleanup
  %244 = load i8, ptr %224, align 1
  %245 = icmp slt i8 %244, 0
  br i1 %245, label %246, label %248

246:                                              ; preds = %241
  %247 = load ptr, ptr %2, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %247) #18
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %2) #17
  br i1 %242, label %37, label %40

248:                                              ; preds = %241
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %2) #17
  br i1 %242, label %37, label %40

249:                                              ; preds = %236, %239
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %2) #17
  store ptr %235, ptr @_ZL27benchmark_uniq_9_benchmark_, align 8, !tbaa !20
  %250 = call noalias nonnull dereferenceable(224) ptr @_Znwm(i64 noundef 224) #16
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %1) #17
  %251 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %1, i64 0, i32 2
  store i8 18, ptr %251, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(18) %1, ptr noundef nonnull align 1 dereferenceable(18) @.str.25, i64 18, i1 false)
  %252 = getelementptr inbounds i8, ptr %1, i64 18
  store i8 0, ptr %252, align 2, !tbaa !90
  %253 = invoke ptr @_ZN9benchmark8internal9BenchmarkC2ERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE(ptr noundef nonnull %250, ptr noundef nonnull align 8 dereferenceable(24) %1)
          to label %254 unwind label %268

254:                                              ; preds = %249
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVN9benchmark8internal17FunctionBenchmarkE, i64 0, inrange i32 0, i64 2), ptr %250, align 8, !tbaa !29
  %255 = getelementptr inbounds %"class.benchmark::internal::FunctionBenchmark", ptr %250, i64 0, i32 1
  store ptr @_ZL18BM_VectorIterationRN9benchmark5StateE, ptr %255, align 8, !tbaa !120
  %256 = invoke ptr @_ZN9benchmark8internal25RegisterBenchmarkInternalEPNS0_9BenchmarkE(ptr noundef nonnull %250)
          to label %257 unwind label %268

257:                                              ; preds = %254
  %258 = invoke ptr @_ZN9benchmark8internal9Benchmark10IterationsEx(ptr noundef %256, i64 noundef 30)
          to label %259 unwind label %268

259:                                              ; preds = %257
  %260 = invoke ptr @_ZN9benchmark8internal9Benchmark15RangeMultiplierEi(ptr noundef %258, i32 noundef 10)
          to label %261 unwind label %268

261:                                              ; preds = %259
  %262 = invoke ptr @_ZN9benchmark8internal9Benchmark5RangeExx(ptr noundef %260, i64 noundef 10, i64 noundef 100000000)
          to label %263 unwind label %268

263:                                              ; preds = %261
  %264 = load i8, ptr %251, align 1
  %265 = icmp slt i8 %264, 0
  br i1 %265, label %266, label %276

266:                                              ; preds = %263
  %267 = load ptr, ptr %1, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %267) #18
  br label %276

268:                                              ; preds = %261, %259, %257, %254, %249
  %269 = phi i1 [ false, %261 ], [ false, %259 ], [ false, %257 ], [ false, %254 ], [ true, %249 ]
  %270 = landingpad { ptr, i32 }
          cleanup
  %271 = load i8, ptr %251, align 1
  %272 = icmp slt i8 %271, 0
  br i1 %272, label %273, label %275

273:                                              ; preds = %268
  %274 = load ptr, ptr %1, align 8, !tbaa !90
  call void @_ZdlPv(ptr noundef %274) #18
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %1) #17
  br i1 %269, label %37, label %40

275:                                              ; preds = %268
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %1) #17
  br i1 %269, label %37, label %40

276:                                              ; preds = %263, %266
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %1) #17
  store ptr %262, ptr @_ZL28benchmark_uniq_10_benchmark_, align 8, !tbaa !20
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #14

attributes #0 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { nobuiltin allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #5 = { nobuiltin nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #6 = { mustprogress norecurse ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #7 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #8 = { mustprogress noreturn ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #9 = { inlinehint mustprogress noreturn ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #10 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #11 = { noinline noreturn nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #12 = { nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #13 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #14 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #15 = { noreturn }
attributes #16 = { builtin allocsize(0) }
attributes #17 = { nounwind }
attributes #18 = { builtin nounwind }
attributes #19 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Apple clang version 16.0.0 (clang-1600.0.26.6)"}
!6 = !{!7, !11, i64 8}
!7 = !{!"_ZTS14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEE", !8, i64 0, !11, i64 8, !11, i64 16, !11, i64 24, !11, i64 32, !12, i64 40, !11, i64 48, !11, i64 56, !11, i64 64, !13, i64 72, !14, i64 73}
!8 = !{!"any pointer", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!"long", !9, i64 0}
!12 = !{!"long long", !9, i64 0}
!13 = !{!"_ZTSNSt3__19allocatorIiEE"}
!14 = !{!"_ZTSNSt3__19allocatorIPiEE"}
!15 = !{!7, !12, i64 40}
!16 = !{!7, !11, i64 32}
!17 = !{!7, !8, i64 0}
!18 = !{!"branch_weights", i32 1, i32 2000}
!19 = !{!7, !11, i64 24}
!20 = !{!8, !8, i64 0}
!21 = !{!7, !11, i64 16}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !9, i64 0}
!24 = !{i64 7929020}
!25 = distinct !{!25, !26}
!26 = !{!"llvm.loop.mustprogress"}
!27 = distinct !{!27, !26}
!28 = distinct !{!28, !26}
!29 = !{!30, !30, i64 0}
!30 = !{!"vtable pointer", !10, i64 0}
!31 = distinct !{!31, !26}
!32 = distinct !{!32, !26}
!33 = !{!7, !11, i64 48}
!34 = !{!7, !11, i64 64}
!35 = !{!7, !11, i64 56}
!36 = distinct !{!36, !26}
!37 = distinct !{!37, !26}
!38 = !{!12, !12, i64 0}
!39 = !{i32 0, i32 33}
!40 = distinct !{!40, !26}
!41 = !{}
!42 = !{!43}
!43 = distinct !{!43, !44, !"_ZN14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEE5beginEv: argument 0"}
!44 = distinct !{!44, !"_ZN14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEE5beginEv"}
!45 = !{!46}
!46 = distinct !{!46, !47, !"_ZN14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEE3endEv: argument 0"}
!47 = distinct !{!47, !"_ZN14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEE3endEv"}
!48 = !{!49, !23, i64 8}
!49 = !{!"_ZTS9STLVectorIiNSt3__19allocatorIiEEE", !8, i64 0, !23, i64 8, !23, i64 12, !13, i64 16}
!50 = !{!49, !23, i64 12}
!51 = !{!49, !8, i64 0}
!52 = distinct !{!52, !26, !53, !54}
!53 = !{!"llvm.loop.isvectorized", i32 1}
!54 = !{!"llvm.loop.unroll.runtime.disable"}
!55 = distinct !{!55, !26, !53}
!56 = distinct !{!56, !26}
!57 = distinct !{!57, !26}
!58 = distinct !{!58, !26, !53, !54}
!59 = distinct !{!59, !26, !53}
!60 = distinct !{!60, !26}
!61 = !{!"branch_weights", i32 2000, i32 1}
!62 = distinct !{!62, !26, !53, !54}
!63 = distinct !{!63, !26, !53}
!64 = distinct !{!64, !26}
!65 = distinct !{!65, !26, !53, !54}
!66 = distinct !{!66, !26, !53}
!67 = distinct !{!67, !26}
!68 = distinct !{!68, !26, !53, !54}
!69 = distinct !{!69, !26, !53}
!70 = distinct !{!70, !26}
!71 = !{!72, !74, i64 28}
!72 = !{!"_ZTSN9benchmark5StateE", !12, i64 0, !12, i64 8, !12, i64 16, !73, i64 24, !73, i64 25, !74, i64 28, !75, i64 32, !12, i64 56, !78, i64 64, !85, i64 88, !23, i64 112, !23, i64 116, !8, i64 120, !8, i64 128, !8, i64 136}
!73 = !{!"bool", !9, i64 0}
!74 = !{!"_ZTSN9benchmark8internal7SkippedE", !9, i64 0}
!75 = !{!"_ZTSNSt3__16vectorIxNS_9allocatorIxEEEE", !8, i64 0, !8, i64 8, !76, i64 16}
!76 = !{!"_ZTSNSt3__117__compressed_pairIPxNS_9allocatorIxEEEE", !77, i64 0}
!77 = !{!"_ZTSNSt3__122__compressed_pair_elemIPxLi0ELb0EEE", !8, i64 0}
!78 = !{!"_ZTSNSt3__13mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEN9benchmark7CounterENS_4lessIS6_EENS4_INS_4pairIKS6_S8_EEEEEE", !79, i64 0}
!79 = !{!"_ZTSNSt3__16__treeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEN9benchmark7CounterEEENS_19__map_value_compareIS7_SA_NS_4lessIS7_EELb1EEENS5_ISA_EEEE", !8, i64 0, !80, i64 8, !83, i64 16}
!80 = !{!"_ZTSNSt3__117__compressed_pairINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEENS_9allocatorINS_11__tree_nodeINS_12__value_typeINS_12basic_stringIcNS_11char_traitsIcEENS7_IcEEEEN9benchmark7CounterEEES3_EEEEEE", !81, i64 0}
!81 = !{!"_ZTSNSt3__122__compressed_pair_elemINS_15__tree_end_nodeIPNS_16__tree_node_baseIPvEEEELi0ELb0EEE", !82, i64 0}
!82 = !{!"_ZTSNSt3__115__tree_end_nodeIPNS_16__tree_node_baseIPvEEEE", !8, i64 0}
!83 = !{!"_ZTSNSt3__117__compressed_pairImNS_19__map_value_compareINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12__value_typeIS7_N9benchmark7CounterEEENS_4lessIS7_EELb1EEEEE", !84, i64 0}
!84 = !{!"_ZTSNSt3__122__compressed_pair_elemImLi0ELb0EEE", !11, i64 0}
!85 = !{!"_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE", !86, i64 0}
!86 = !{!"_ZTSNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EE", !87, i64 0}
!87 = !{!"_ZTSNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEE", !88, i64 0}
!88 = !{!"_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repE", !9, i64 0}
!89 = !{!11, !11, i64 0}
!90 = !{!9, !9, i64 0}
!91 = !{!75, !8, i64 0}
!92 = distinct !{!92, !26}
!93 = !{i64 7929268}
!94 = !{!95}
!95 = distinct !{!95, !96, !"_ZN14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEE5beginEv: argument 0"}
!96 = distinct !{!96, !"_ZN14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEE5beginEv"}
!97 = !{!98}
!98 = distinct !{!98, !99, !"_ZN14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEE3endEv: argument 0"}
!99 = distinct !{!99, !"_ZN14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEE3endEv"}
!100 = distinct !{!100, !26, !53, !54}
!101 = distinct !{!101, !26, !53}
!102 = distinct !{!102, !26, !53, !54}
!103 = distinct !{!103, !26, !53}
!104 = distinct !{!104, !26, !53, !54}
!105 = distinct !{!105, !26, !53}
!106 = distinct !{!106, !26, !53, !54}
!107 = distinct !{!107, !26, !53}
!108 = distinct !{!108, !26, !53, !54}
!109 = distinct !{!109, !26, !53}
!110 = !{!111, !73, i64 0}
!111 = !{!"_ZTSNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryE", !73, i64 0, !8, i64 8}
!112 = !{i8 0, i8 2}
!113 = !{!114, !8, i64 40}
!114 = !{!"_ZTSNSt3__18ios_baseE", !23, i64 8, !11, i64 16, !11, i64 24, !23, i64 32, !23, i64 36, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !11, i64 72, !11, i64 80, !8, i64 88, !11, i64 96, !11, i64 104, !8, i64 112, !11, i64 120, !11, i64 128}
!115 = !{!114, !23, i64 8}
!116 = !{!117, !23, i64 144}
!117 = !{!"_ZTSNSt3__19basic_iosIcNS_11char_traitsIcEEEE", !114, i64 0, !8, i64 136, !23, i64 144}
!118 = !{!114, !23, i64 32}
!119 = !{!114, !11, i64 24}
!120 = !{!121, !8, i64 216}
!121 = !{!"_ZTSN9benchmark8internal17FunctionBenchmarkE", !122, i64 0, !8, i64 216}
!122 = !{!"_ZTSN9benchmark8internal9BenchmarkE", !85, i64 8, !123, i64 32, !124, i64 40, !127, i64 64, !130, i64 88, !73, i64 92, !23, i64 96, !131, i64 104, !131, i64 112, !12, i64 120, !23, i64 128, !73, i64 132, !73, i64 133, !73, i64 134, !132, i64 136, !8, i64 144, !133, i64 152, !136, i64 176, !8, i64 200, !8, i64 208}
!123 = !{!"_ZTSN9benchmark8internal21AggregationReportModeE", !9, i64 0}
!124 = !{!"_ZTSNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE", !8, i64 0, !8, i64 8, !125, i64 16}
!125 = !{!"_ZTSNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEE", !126, i64 0}
!126 = !{!"_ZTSNSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EEE", !8, i64 0}
!127 = !{!"_ZTSNSt3__16vectorINS0_IxNS_9allocatorIxEEEENS1_IS3_EEEE", !8, i64 0, !8, i64 8, !128, i64 16}
!128 = !{!"_ZTSNSt3__117__compressed_pairIPNS_6vectorIxNS_9allocatorIxEEEENS2_IS4_EEEE", !129, i64 0}
!129 = !{!"_ZTSNSt3__122__compressed_pair_elemIPNS_6vectorIxNS_9allocatorIxEEEELi0ELb0EEE", !8, i64 0}
!130 = !{!"_ZTSN9benchmark8TimeUnitE", !9, i64 0}
!131 = !{!"double", !9, i64 0}
!132 = !{!"_ZTSN9benchmark4BigOE", !9, i64 0}
!133 = !{!"_ZTSNSt3__16vectorIN9benchmark8internal10StatisticsENS_9allocatorIS3_EEEE", !8, i64 0, !8, i64 8, !134, i64 16}
!134 = !{!"_ZTSNSt3__117__compressed_pairIPN9benchmark8internal10StatisticsENS_9allocatorIS3_EEEE", !135, i64 0}
!135 = !{!"_ZTSNSt3__122__compressed_pair_elemIPN9benchmark8internal10StatisticsELi0ELb0EEE", !8, i64 0}
!136 = !{!"_ZTSNSt3__16vectorIiNS_9allocatorIiEEEE", !8, i64 0, !8, i64 8, !137, i64 16}
!137 = !{!"_ZTSNSt3__117__compressed_pairIPiNS_9allocatorIiEEEE", !138, i64 0}
!138 = !{!"_ZTSNSt3__122__compressed_pair_elemIPiLi0ELb0EEE", !8, i64 0}
