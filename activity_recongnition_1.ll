; ModuleID = 'activity_recognition.6e1f58ff25859db2-cgu.0'
source_filename = "activity_recognition.6e1f58ff25859db2-cgu.0"
target datalayout = "e-m:e-p:16:16-i32:16-i64:16-f32:16-f64:16-a:8-n8:16-S16"
target triple = "msp430-unknown-none-elf"

%threeAxis_t_8 = type { i8, i8, i8 }
%features_t = type { i16, i16 }

@IO_NAME = dso_local local_unnamed_addr constant ptr @readSensor, align 2
@_ZN20activity_recognition12SENSOR_VALUE17h0c8fd7fca47fe2f6E = internal global [1 x i8] zeroinitializer, align 1
@_ZN20activity_recognition11SENSOR_SEED17h7a817826e09fdfcdE = internal global [2 x i8] c"\01\00", align 2
@_ZN20activity_recognition16o0s6dy295o09is8316o0s6dy295o09is838COUNT_NV17ha628f6d4e851d6a5E.0 = internal unnamed_addr global i16 1, section ".fram", align 2
@_ZN20activity_recognition16o0s6dy295o09is8316o0s6dy295o09is838MODEL_NV17h01caeb00ce359907E = internal global [128 x i8] zeroinitializer, section ".fram", align 2
@_ZN20activity_recognition16o0s6dy295o09is8316o0s6dy295o09is837SEED_NV17hcc0e2727a71493bbE.0 = internal unnamed_addr global i16 1, section ".fram", align 2
@_ZN4libm4math7generic4sqrt9RSQRT_TAB17h29145966abca1189E = internal unnamed_addr constant [256 x i8] c"Q\B4\F0\B2\96\B1D\B0\F9\AE\B6\ADy\ACC\AB\14\AA\EB\A8\C8\A7\AA\A6\92\A5\80\A4s\A3k\A2h\A1j\A0p\9F{\9E\8A\9D\9D\9C\B5\9B\D1\9A\F0\99\13\99:\98e\97\93\96\C4\95\F8\940\94k\93\A9\92\EA\91.\91u\90\BE\8F\0A\8FY\8E\AA\8D\FE\8CT\8C\AC\8B\07\8Bd\8A\C4\89%\89\89\88\EE\87V\87\C0\86+\86\99\85\08\85y\84\EC\83a\83\D8\82P\82\C9\81E\81\C2\80@\80\02\FF\0E\FD%\FBG\F9s\F7\AA\F5\EA\F34\F2\87\F0\E3\EEG\ED\B3\EB'\EA\A3\E8'\E7\B2\E5C\E4\DC\E2z\E1 \E0\CB\DE}\DD4\DC\F1\DA\B3\D9{\D8H\D7\1A\D6\F1\D4\CD\D3\AD\D2\92\D1{\D0i\CF[\CEQ\CDJ\CCH\CBJ\CAO\C9X\C8d\C7t\C6\87\C5\9D\C4\B7\C3\D4\C2\F4\C1\16\C1<\C0e\BF\90\BE\BE\BD\EF\BC#\BCY\BB\91\BA\CC\B9\0A\B9J\B8\8C\B7\D0\B6\17\B6`\B5", align 2
@__RESET_VECTOR = dso_local local_unnamed_addr constant ptr @Reset, section ".__RESET_VECTOR", align 2
@__INTERRUPTS = dso_local constant <{ [52 x i8], ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }> <{ [52 x i8] zeroinitializer, ptr @LEA, ptr @PORT8, ptr @PORT7, ptr @EUSCI_B3, ptr @EUSCI_B2, ptr @EUSCI_B1, ptr @EUSCI_A3, ptr @EUSCI_A2, ptr @PORT6, ptr @PORT5, ptr @TIMER4_A1, ptr @TIMER4_A0, ptr @AES256, ptr @RTC_C, ptr @PORT4, ptr @PORT3, ptr @TIMER3_A1, ptr @TIMER3_A0, ptr @PORT2, ptr @TIMER2_A1, ptr @TIMER2_A0, ptr @PORT1, ptr @TIMER1_A1, ptr @TIMER1_A0, ptr @DMA, ptr @EUSCI_A1, ptr @TIMER0_A1, ptr @TIMER0_A0, ptr @ADC12_B, ptr @EUSCI_B0, ptr @EUSCI_A0, ptr @WDT, ptr @TIMER0_B1, ptr @TIMER0_B0, ptr @COMP_E, ptr @UNMI, ptr @SYSNMI }>, section ".vector_table.interrupts", align 2
@DEVICE_PERIPHERALS = dso_local local_unnamed_addr global [1 x i8] zeroinitializer, align 1
@llvm.compiler.used = appending global [1 x ptr] [ptr @__INTERRUPTS], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nounwind optsize willreturn memory(readwrite, argmem: none)
define dso_local noundef i8 @readSensor(i16 %_input) unnamed_addr #0 {
start:
  %0 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h0c8fd7fca47fe2f6E, align 1
  ret i8 %0
}

; activity_recognition::transform
; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define internal fastcc void @_ZN20activity_recognition9transform17h40d191452f1c1853E(ptr noalias nocapture noundef nonnull align 1 dereferenceable(9) %window) unnamed_addr #1 {
start:
  br label %bb7

bb6:                                              ; preds = %bb24
  ret void

bb7:                                              ; preds = %start, %bb24
  %iter.sroa.0.05 = phi i16 [ 0, %start ], [ %_0.i.i.i.i, %bb24 ]
  %_0.i.i.i.i = add nuw nsw i16 %iter.sroa.0.05, 1
  %sample = getelementptr inbounds nuw %threeAxis_t_8, ptr %window, i16 %iter.sroa.0.05
  %_11 = load i8, ptr %sample, align 1, !noundef !1
  %_10 = icmp ult i8 %_11, 10
  %.phi.trans.insert = getelementptr inbounds nuw i8, ptr %sample, i16 1
  %_21.pre = load i8, ptr %.phi.trans.insert, align 1
  %_12 = icmp ult i8 %_21.pre, 10
  %or.cond = select i1 %_10, i1 true, i1 %_12
  %.phi.trans.insert7 = getelementptr inbounds nuw i8, ptr %sample, i16 2
  %_24.pre = load i8, ptr %.phi.trans.insert7, align 1
  %_14 = icmp ult i8 %_24.pre, 10
  %or.cond9 = select i1 %or.cond, i1 true, i1 %_14
  br i1 %or.cond9, label %bb13, label %bb24

bb24:                                             ; preds = %bb7, %bb13
  %exitcond.not = icmp eq i16 %_0.i.i.i.i, 3
  br i1 %exitcond.not, label %bb6, label %bb7

bb13:                                             ; preds = %bb7
  %_17 = icmp ugt i8 %_11, 10
  %_18. = select i1 %_17, i8 %_11, i8 0
  store i8 %_18., ptr %sample, align 1
  %_20 = icmp ugt i8 %_21.pre, 10
  %_19.sroa.0.0 = select i1 %_20, i8 %_21.pre, i8 0
  store i8 %_19.sroa.0.0, ptr %.phi.trans.insert, align 1
  %0 = getelementptr inbounds nuw i8, ptr %sample, i16 2
  %_23 = icmp ugt i8 %_24.pre, 10
  %_22.sroa.0.0 = select i1 %_23, i8 %_24.pre, i8 0
  store i8 %_22.sroa.0.0, ptr %0, align 1
  br label %bb24
}

; activity_recognition::featurize
; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: readwrite, inaccessiblemem: readwrite)
define internal fastcc void @_ZN20activity_recognition9featurize17h31714ac89f26ea2aE(ptr noalias nocapture noundef nonnull writeonly align 2 dereferenceable(4) %features, ptr noalias nocapture noundef nonnull readonly align 1 dereferenceable(9) %aWin) unnamed_addr #2 {
start:
  %0 = alloca [8 x i8], align 2
  %1 = alloca [8 x i8], align 2
  br label %bb7

bb6:                                              ; preds = %bb7
  %.lcssa120 = phi i8 [ %22, %bb7 ]
  %.lcssa119 = phi i8 [ %24, %bb7 ]
  %.lcssa118 = phi i8 [ %26, %bb7 ]
  %2 = lshr i8 %.lcssa120, 2
  %3 = lshr i8 %.lcssa119, 2
  %4 = lshr i8 %.lcssa118, 2
  br label %bb15

bb14:                                             ; preds = %bb15
  %.lcssa117 = phi i8 [ %12, %bb15 ]
  %.lcssa116 = phi i8 [ %16, %bb15 ]
  %.lcssa = phi i8 [ %20, %bb15 ]
  %5 = lshr i8 %.lcssa117, 2
  %6 = lshr i8 %.lcssa116, 2
  %7 = lshr i8 %.lcssa, 2
  %_47 = zext nneg i8 %2 to i32
  %_46 = mul nuw nsw i32 %_47, %_47
  %_52 = zext nneg i8 %3 to i32
  %_51 = mul nuw nsw i32 %_52, %_52
  %_45 = add nuw nsw i32 %_46, %_51
  %_57 = zext nneg i8 %4 to i32
  %_56 = mul nuw nsw i32 %_57, %_57
  %meanmag = add nuw nsw i32 %_45, %_56
  %_64 = zext nneg i8 %5 to i32
  %_63 = mul nuw nsw i32 %_64, %_64
  %_69 = zext nneg i8 %6 to i32
  %_68 = mul nuw nsw i32 %_69, %_69
  %_62 = add nuw nsw i32 %_68, %_63
  %_74 = zext nneg i8 %7 to i32
  %_73 = mul nuw nsw i32 %_74, %_74
  %stddevmag = add nuw nsw i32 %_62, %_73
  %_3.i55 = uitofp nneg i32 %meanmag to double
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %0)
; call libm::math::sqrt::sqrt
  call fastcc void @_ZN4libm4math4sqrt4sqrt17h0b674c17b9d70e0dE(ptr noalias nocapture noundef nonnull align 2 dereferenceable(8) %0, double noundef %_3.i55) #15
  %_2.i56 = load double, ptr %0, align 2, !noundef !1
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %0)
  %_0.i57 = tail call noundef i16 @llvm.fptoui.sat.i16.f64(double %_2.i56)
  store i16 %_0.i57, ptr %features, align 2
  %_3.i = uitofp nneg i32 %stddevmag to double
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %1)
; call libm::math::sqrt::sqrt
  call fastcc void @_ZN4libm4math4sqrt4sqrt17h0b674c17b9d70e0dE(ptr noalias nocapture noundef nonnull align 2 dereferenceable(8) %1, double noundef %_3.i) #15
  %_2.i = load double, ptr %1, align 2, !noundef !1
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %1)
  %_0.i = tail call noundef i16 @llvm.fptoui.sat.i16.f64(double %_2.i)
  %8 = getelementptr inbounds nuw i8, ptr %features, i16 2
  store i16 %_0.i, ptr %8, align 2
  ret void

bb15:                                             ; preds = %bb6, %bb15
  %stddev5.sroa.0.079 = phi i8 [ 0, %bb6 ], [ %20, %bb15 ]
  %stddev4.sroa.0.078 = phi i8 [ 0, %bb6 ], [ %16, %bb15 ]
  %stddev.sroa.0.077 = phi i8 [ 0, %bb6 ], [ %12, %bb15 ]
  %iter1.sroa.0.076 = phi i16 [ 0, %bb6 ], [ %_0.i.i.i.i64, %bb15 ]
  %_0.i.i.i.i64 = add nuw nsw i16 %iter1.sroa.0.076, 1
  %9 = getelementptr inbounds nuw %threeAxis_t_8, ptr %aWin, i16 %iter1.sroa.0.076
  %_21 = load i8, ptr %9, align 1, !noundef !1
  %_20 = icmp ugt i8 %_21, %2
  %10 = sub i8 %_21, %2
  %11 = sub nsw i8 %2, %_21
  %_19.sroa.0.0 = select i1 %_20, i8 %10, i8 %11
  %12 = add i8 %_19.sroa.0.0, %stddev.sroa.0.077
  %13 = getelementptr inbounds nuw i8, ptr %9, i16 1
  %_30 = load i8, ptr %13, align 1, !noundef !1
  %_29 = icmp ugt i8 %_30, %3
  %14 = sub i8 %_30, %3
  %15 = sub nsw i8 %3, %_30
  %_28.sroa.0.0 = select i1 %_29, i8 %14, i8 %15
  %16 = add i8 %_28.sroa.0.0, %stddev4.sroa.0.078
  %17 = getelementptr inbounds nuw i8, ptr %9, i16 2
  %_38 = load i8, ptr %17, align 1, !noundef !1
  %_37 = icmp ugt i8 %_38, %4
  %18 = sub i8 %_38, %4
  %19 = sub nsw i8 %4, %_38
  %_36.sroa.0.0 = select i1 %_37, i8 %18, i8 %19
  %20 = add i8 %_36.sroa.0.0, %stddev5.sroa.0.079
  %exitcond85.not = icmp eq i16 %_0.i.i.i.i64, 3
  br i1 %exitcond85.not, label %bb14, label %bb15

bb7:                                              ; preds = %start, %bb7
  %mean3.sroa.0.075 = phi i8 [ 0, %start ], [ %26, %bb7 ]
  %mean.sroa.0.074 = phi i8 [ 0, %start ], [ %22, %bb7 ]
  %mean2.sroa.0.073 = phi i8 [ 0, %start ], [ %24, %bb7 ]
  %iter.sroa.0.072 = phi i16 [ 0, %start ], [ %_0.i.i.i.i, %bb7 ]
  %_0.i.i.i.i = add nuw nsw i16 %iter.sroa.0.072, 1
  %21 = getelementptr inbounds nuw %threeAxis_t_8, ptr %aWin, i16 %iter.sroa.0.072
  %_9 = load i8, ptr %21, align 1, !noundef !1
  %22 = add i8 %_9, %mean.sroa.0.074
  %23 = getelementptr inbounds nuw i8, ptr %21, i16 1
  %_11 = load i8, ptr %23, align 1, !noundef !1
  %24 = add i8 %_11, %mean2.sroa.0.073
  %25 = getelementptr inbounds nuw i8, ptr %21, i16 2
  %_12 = load i8, ptr %25, align 1, !noundef !1
  %26 = add i8 %_12, %mean3.sroa.0.075
  %exitcond.not = icmp eq i16 %_0.i.i.i.i, 3
  br i1 %exitcond.not, label %bb6, label %bb7
}

; activity_recognition::train
; Function Attrs: nofree norecurse nounwind optsize
define internal fastcc void @_ZN20activity_recognition5train17hb1589bd7817a75a4E(ptr noalias nocapture noundef writeonly align 2 dereferenceable(64) %classModel, ptr noalias nocapture noundef nonnull align 2 dereferenceable(2) %seed) unnamed_addr #3 {
start:
  %features = alloca [4 x i8], align 2
  %sampleWindow = alloca [9 x i8], align 1
  call void @llvm.lifetime.start.p0(i64 9, ptr nonnull %sampleWindow)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(9) %sampleWindow, i8 0, i64 9, i1 false)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %features)
  store i16 0, ptr %features, align 2
  %0 = getelementptr inbounds nuw i8, ptr %features, i16 2
  store i16 0, ptr %0, align 2
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2)
  %seed.promoted.i = load i16, ptr %seed, align 2, !alias.scope !5, !noalias !8
  br label %bb2.i

bb2.i:                                            ; preds = %bb2.i, %start
  %discardedSamplesCount.sroa.0.04.i = phi i16 [ 0, %start ], [ %4, %bb2.i ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !10)
  %1 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h0c8fd7fca47fe2f6E, align 1, !noalias !11
  %2 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h0c8fd7fca47fe2f6E, align 1, !noalias !11
  %3 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h0c8fd7fca47fe2f6E, align 1, !noalias !11
  %4 = add nuw nsw i16 %discardedSamplesCount.sroa.0.04.i, 1
  %exitcond.not.i = icmp eq i16 %4, 3
  br i1 %exitcond.not.i, label %_ZN20activity_recognition13warmup_sensor17h54aba2b1d6edc7ccE.exit, label %bb2.i

_ZN20activity_recognition13warmup_sensor17h54aba2b1d6edc7ccE.exit: ; preds = %bb2.i
  %5 = add i16 %seed.promoted.i, 3
  br label %bb6

bb6:                                              ; preds = %_ZN20activity_recognition13warmup_sensor17h54aba2b1d6edc7ccE.exit, %_ZN20activity_recognition14acquire_window17hf377e5c9b9bab393E.exit
  %iter.sroa.0.019 = phi i16 [ 0, %_ZN20activity_recognition13warmup_sensor17h54aba2b1d6edc7ccE.exit ], [ %_0.i.i.i.i, %_ZN20activity_recognition14acquire_window17hf377e5c9b9bab393E.exit ]
  %6 = phi i16 [ %5, %_ZN20activity_recognition13warmup_sensor17h54aba2b1d6edc7ccE.exit ], [ %12, %_ZN20activity_recognition14acquire_window17hf377e5c9b9bab393E.exit ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !12)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !15)
  br label %bb2.i14

bb2.i14:                                          ; preds = %bb2.i14, %bb6
  %samplesInWindow.sroa.0.03.i = phi i16 [ 0, %bb6 ], [ %11, %bb2.i14 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !17)
  %7 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h0c8fd7fca47fe2f6E, align 1, !noalias !20
  %8 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h0c8fd7fca47fe2f6E, align 1, !noalias !20
  %9 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h0c8fd7fca47fe2f6E, align 1, !noalias !20
  %10 = getelementptr inbounds nuw %threeAxis_t_8, ptr %sampleWindow, i16 %samplesInWindow.sroa.0.03.i
  store i8 %7, ptr %10, align 1, !alias.scope !12, !noalias !15
  %sample.sroa.2.0..sroa_idx.i = getelementptr inbounds nuw i8, ptr %10, i16 1
  store i8 %8, ptr %sample.sroa.2.0..sroa_idx.i, align 1, !alias.scope !12, !noalias !15
  %sample.sroa.3.0..sroa_idx.i = getelementptr inbounds nuw i8, ptr %10, i16 2
  store i8 %9, ptr %sample.sroa.3.0..sroa_idx.i, align 1, !alias.scope !12, !noalias !15
  %11 = add nuw nsw i16 %samplesInWindow.sroa.0.03.i, 1
  %exitcond.not.i15 = icmp eq i16 %11, 3
  br i1 %exitcond.not.i15, label %_ZN20activity_recognition14acquire_window17hf377e5c9b9bab393E.exit, label %bb2.i14

_ZN20activity_recognition14acquire_window17hf377e5c9b9bab393E.exit: ; preds = %bb2.i14
  %_0.i.i.i.i = add nuw nsw i16 %iter.sroa.0.019, 1
  %12 = add i16 %6, 3
  store i16 %12, ptr %seed, align 2, !alias.scope !22, !noalias !23
; call activity_recognition::transform
  call fastcc void @_ZN20activity_recognition9transform17h40d191452f1c1853E(ptr noalias noundef align 1 dereferenceable(9) %sampleWindow) #15
; call activity_recognition::featurize
  call fastcc void @_ZN20activity_recognition9featurize17h31714ac89f26ea2aE(ptr noalias noundef align 2 dereferenceable(4) %features, ptr noalias noundef readonly align 1 dereferenceable(9) %sampleWindow) #15
  %_20 = load i16, ptr %features, align 2, !noundef !1
  %13 = getelementptr inbounds nuw %features_t, ptr %classModel, i16 %iter.sroa.0.019
  store i16 %_20, ptr %13, align 2
  %_22 = load i16, ptr %0, align 2, !noundef !1
  %14 = getelementptr inbounds nuw i8, ptr %13, i16 2
  store i16 %_22, ptr %14, align 2
  %exitcond.not = icmp eq i16 %_0.i.i.i.i, 16
  br i1 %exitcond.not, label %bb7, label %bb6

bb7:                                              ; preds = %_ZN20activity_recognition14acquire_window17hf377e5c9b9bab393E.exit
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %features)
  call void @llvm.lifetime.end.p0(i64 9, ptr nonnull %sampleWindow)
  ret void
}

; Function Attrs: nofree norecurse nounwind optsize memory(readwrite, argmem: none)
define dso_local msp430_intrcc void @TIMER0_A0() unnamed_addr #4 {
start:
  %0 = load volatile i16, ptr @_ZN20activity_recognition11SENSOR_SEED17h7a817826e09fdfcdE, align 2
  %_2.i = urem i16 %0, 85
  %_0.i1 = trunc nuw nsw i16 %_2.i to i8
  store volatile i8 %_0.i1, ptr @_ZN20activity_recognition12SENSOR_VALUE17h0c8fd7fca47fe2f6E, align 1
  %_0.i = add i16 %0, 1
  store volatile i16 %_0.i, ptr @_ZN20activity_recognition11SENSOR_SEED17h7a817826e09fdfcdE, align 2
  ret void
}

; Function Attrs: cold noreturn nounwind optsize
define dso_local void @abort() unnamed_addr #5 {
start:
; call core::panicking::panic
  tail call fastcc void @_ZN4core9panicking5panic17h771a552b74645b72E() #16
  unreachable
}

; Function Attrs: noreturn nounwind optsize
define dso_local void @main() unnamed_addr #6 {
start:
  %features.i = alloca [4 x i8], align 2
  %sampleWindow.i = alloca [9 x i8], align 1
  %localSeed.i = alloca [2 x i8], align 2
  store i8 1, ptr @DEVICE_PERIPHERALS, align 1
  store volatile i16 0, ptr inttoptr (i16 832 to ptr), align 64
  store volatile i16 1000, ptr inttoptr (i16 850 to ptr), align 2
  %0 = load volatile i16, ptr inttoptr (i16 832 to ptr), align 64
  %1 = or i16 %0, 4
  store volatile i16 %1, ptr inttoptr (i16 832 to ptr), align 64
  %2 = load volatile i16, ptr inttoptr (i16 834 to ptr), align 2
  %3 = or i16 %2, 16
  store volatile i16 %3, ptr inttoptr (i16 834 to ptr), align 2
  store volatile i16 528, ptr inttoptr (i16 832 to ptr), align 64
  tail call void asm sideeffect "nop { eint { nop", "~{sr},~{memory}"() #15, !srcloc !24
  %.pre = load i16, ptr @_ZN20activity_recognition16o0s6dy295o09is8316o0s6dy295o09is837SEED_NV17hcc0e2727a71493bbE.0, align 2
  br label %bb2.i

bb2.i:                                            ; preds = %bb18.i, %start
  %4 = phi i16 [ %.pre, %start ], [ %_23.i, %bb18.i ]
  %prev_pin_state.i.sroa.0.0 = phi i8 [ 3, %start ], [ %prev_pin_state.i.sroa.0.1, %bb18.i ]
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %localSeed.i)
  store i16 %4, ptr %localSeed.i, align 2
  %_4.i = load i16, ptr @_ZN20activity_recognition16o0s6dy295o09is8316o0s6dy295o09is838COUNT_NV17ha628f6d4e851d6a5E.0, align 2, !noalias !25, !noundef !1
  %5 = add i16 %_4.i, 1
  store i16 %5, ptr @_ZN20activity_recognition16o0s6dy295o09is8316o0s6dy295o09is838COUNT_NV17ha628f6d4e851d6a5E.0, align 2, !noalias !25
  switch i16 %_4.i, label %bb1.i [
    i16 0, label %bb12.i1.thread
    i16 1, label %bb12.i1.thread
    i16 2, label %bb12.i1
    i16 3, label %bb12.i1
    i16 4, label %bb8.i
    i16 5, label %bb8.i
    i16 6, label %bb12.i
  ]

bb1.i:                                            ; preds = %bb2.i
  %6 = icmp eq i16 %5, 7
  br i1 %6, label %bb12.i, label %bb18.i

bb12.i1:                                          ; preds = %bb2.i, %bb2.i
  %_9.i = icmp eq i8 %prev_pin_state.i.sroa.0.0, 2
  br i1 %_9.i, label %bb18.i, label %bb4.i

bb12.i1.thread:                                   ; preds = %bb2.i, %bb2.i
  %_9.i19 = icmp eq i8 %prev_pin_state.i.sroa.0.0, 1
  br i1 %_9.i19, label %bb18.i, label %bb6.i

bb4.i:                                            ; preds = %bb12.i1
; call activity_recognition::train
  call fastcc void @_ZN20activity_recognition5train17hb1589bd7817a75a4E(ptr noalias noundef nonnull align 2 dereferenceable(64) @_ZN20activity_recognition16o0s6dy295o09is8316o0s6dy295o09is838MODEL_NV17h01caeb00ce359907E, ptr noalias noundef align 2 dereferenceable(2) %localSeed.i) #15
  br label %bb18.i

bb18.i:                                           ; preds = %bb12.i1.thread, %bb1.i, %bb12.i1, %bb12.i, %_ZN20activity_recognition9recognize17hb04c457971b043f5E.exit, %bb6.i, %bb4.i
  %prev_pin_state.i.sroa.0.1 = phi i8 [ 3, %bb12.i ], [ 0, %_ZN20activity_recognition9recognize17hb04c457971b043f5E.exit ], [ 1, %bb6.i ], [ 2, %bb4.i ], [ 2, %bb12.i1 ], [ 3, %bb1.i ], [ 1, %bb12.i1.thread ]
  %_23.i = load i16, ptr %localSeed.i, align 2, !noundef !1
  store i16 %_23.i, ptr @_ZN20activity_recognition16o0s6dy295o09is8316o0s6dy295o09is837SEED_NV17hcc0e2727a71493bbE.0, align 2
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %localSeed.i)
  br label %bb2.i

bb6.i:                                            ; preds = %bb12.i1.thread
; call activity_recognition::train
  call fastcc void @_ZN20activity_recognition5train17hb1589bd7817a75a4E(ptr noalias noundef nonnull align 2 dereferenceable(64) getelementptr inbounds nuw (i8, ptr @_ZN20activity_recognition16o0s6dy295o09is8316o0s6dy295o09is838MODEL_NV17h01caeb00ce359907E, i16 64), ptr noalias noundef align 2 dereferenceable(2) %localSeed.i) #15
  br label %bb18.i

bb8.i:                                            ; preds = %bb2.i, %bb2.i
  tail call void @llvm.experimental.noalias.scope.decl(metadata !28)
  call void @llvm.lifetime.start.p0(i64 9, ptr nonnull %sampleWindow.i), !noalias !28
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(9) %sampleWindow.i, i8 0, i64 9, i1 false), !noalias !28
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %features.i), !noalias !28
  br label %bb5.i

bb5.i:                                            ; preds = %_ZN20activity_recognition14acquire_window17hf377e5c9b9bab393E.exit.i, %bb8.i
  %stats.sroa.0.023.i = phi i16 [ 0, %bb8.i ], [ %12, %_ZN20activity_recognition14acquire_window17hf377e5c9b9bab393E.exit.i ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !31)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !34)
  br label %bb2.i.i

bb2.i.i:                                          ; preds = %bb2.i.i, %bb5.i
  %samplesInWindow.sroa.0.03.i.i = phi i16 [ 0, %bb5.i ], [ %11, %bb2.i.i ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !36)
  %7 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h0c8fd7fca47fe2f6E, align 1, !noalias !39
  %8 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h0c8fd7fca47fe2f6E, align 1, !noalias !39
  %9 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h0c8fd7fca47fe2f6E, align 1, !noalias !39
  %10 = getelementptr inbounds nuw %threeAxis_t_8, ptr %sampleWindow.i, i16 %samplesInWindow.sroa.0.03.i.i
  store i8 %7, ptr %10, align 1, !alias.scope !31, !noalias !41
  %sample.sroa.2.0..sroa_idx.i.i = getelementptr inbounds nuw i8, ptr %10, i16 1
  store i8 %8, ptr %sample.sroa.2.0..sroa_idx.i.i, align 1, !alias.scope !31, !noalias !41
  %sample.sroa.3.0..sroa_idx.i.i = getelementptr inbounds nuw i8, ptr %10, i16 2
  store i8 %9, ptr %sample.sroa.3.0..sroa_idx.i.i, align 1, !alias.scope !31, !noalias !41
  %11 = add nuw nsw i16 %samplesInWindow.sroa.0.03.i.i, 1
  %exitcond.not.i.i = icmp eq i16 %11, 3
  br i1 %exitcond.not.i.i, label %_ZN20activity_recognition14acquire_window17hf377e5c9b9bab393E.exit.i, label %bb2.i.i

_ZN20activity_recognition14acquire_window17hf377e5c9b9bab393E.exit.i: ; preds = %bb2.i.i
; call activity_recognition::transform
  call fastcc void @_ZN20activity_recognition9transform17h40d191452f1c1853E(ptr noalias noundef align 1 dereferenceable(9) %sampleWindow.i) #15, !noalias !28
; call activity_recognition::featurize
  call fastcc void @_ZN20activity_recognition9featurize17h31714ac89f26ea2aE(ptr noalias noundef align 2 dereferenceable(4) %features.i, ptr noalias noundef readonly align 1 dereferenceable(9) %sampleWindow.i) #15, !noalias !28
  %12 = add nuw nsw i16 %stats.sroa.0.023.i, 1
  %exitcond.not.i = icmp eq i16 %12, 128
  br i1 %exitcond.not.i, label %_ZN20activity_recognition9recognize17hb04c457971b043f5E.exit, label %bb5.i

_ZN20activity_recognition9recognize17hb04c457971b043f5E.exit: ; preds = %_ZN20activity_recognition14acquire_window17hf377e5c9b9bab393E.exit.i
  %13 = add i16 %4, 384
  store i16 %13, ptr %localSeed.i, align 2, !alias.scope !42, !noalias !43
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %features.i), !noalias !28
  call void @llvm.lifetime.end.p0(i64 9, ptr nonnull %sampleWindow.i), !noalias !28
  br label %bb18.i

bb12.i:                                           ; preds = %bb1.i, %bb2.i
  store i16 1, ptr %localSeed.i, align 2
  store i16 1, ptr @_ZN20activity_recognition16o0s6dy295o09is8316o0s6dy295o09is838COUNT_NV17ha628f6d4e851d6a5E.0, align 2
  store i8 1, ptr @DEVICE_PERIPHERALS, align 1
  %14 = load volatile i8, ptr inttoptr (i16 514 to ptr), align 2
  %_4.i2 = xor i8 %14, 1
  store volatile i8 %_4.i2, ptr inttoptr (i16 514 to ptr), align 2
  store i8 1, ptr @DEVICE_PERIPHERALS, align 1
  %15 = load volatile i8, ptr inttoptr (i16 514 to ptr), align 2
  %_4.i4 = xor i8 %15, 1
  store volatile i8 %_4.i4, ptr inttoptr (i16 514 to ptr), align 2
  br label %bb18.i
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.fptoui.sat.i16.f64(double) #7

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #8

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #8

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #9

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #10

; core::panicking::panic_fmt
; Function Attrs: cold noinline noreturn nounwind optsize
define internal fastcc void @_ZN4core9panicking9panic_fmt17hb4e8523a0c852053E() unnamed_addr #11 {
  tail call void asm sideeffect "dint { nop", "~{sr},~{memory}"() #15, !srcloc !44
  br label %1

1:                                                ; preds = %1, %0
  tail call void asm sideeffect "", "~{memory}"() #15, !srcloc !45
  br label %1
}

; core::panicking::panic
; Function Attrs: cold noinline noreturn nounwind optsize
define internal fastcc void @_ZN4core9panicking5panic17h771a552b74645b72E() unnamed_addr #11 {
; call core::panicking::panic_fmt
  tail call fastcc void @_ZN4core9panicking9panic_fmt17hb4e8523a0c852053E() #16
  unreachable
}

; libm::math::sqrt::sqrt
; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: write, inaccessiblemem: readwrite)
define internal fastcc void @_ZN4libm4math4sqrt4sqrt17h0b674c17b9d70e0dE(ptr dead_on_unwind noalias nocapture noundef nonnull writable writeonly align 2 dereferenceable(8) %0, double noundef %1) unnamed_addr #12 {
  tail call void @llvm.experimental.noalias.scope.decl(metadata !46)
  %3 = bitcast double %1 to i64
  %4 = lshr i64 %3, 52
  %5 = trunc nuw nsw i64 %4 to i32
  %6 = add nsw i32 %5, -2047
  %7 = icmp ult i32 %6, -2046
  br i1 %7, label %8, label %21

8:                                                ; preds = %2
  %9 = fcmp oeq double %1, 0.000000e+00
  %10 = icmp eq i64 %3, 9218868437227405312
  %11 = or i1 %9, %10
  br i1 %11, label %109, label %12

12:                                               ; preds = %8
  %13 = icmp ugt i64 %3, 9218868437227405312
  br i1 %13, label %109, label %14

14:                                               ; preds = %12
  %15 = fmul double %1, 0x4330000000000000
  %16 = bitcast double %15 to i64
  %17 = lshr i64 %16, 52
  %18 = trunc nuw nsw i64 %17 to i32
  %19 = and i32 %18, 2047
  %20 = add nsw i32 %19, -52
  br label %21

21:                                               ; preds = %14, %2
  %22 = phi i64 [ %16, %14 ], [ %3, %2 ]
  %23 = phi i32 [ %20, %14 ], [ %5, %2 ]
  %24 = shl i64 %22, 11
  %25 = or i64 %24, -9223372036854775808
  %26 = and i32 %23, 1
  %27 = zext nneg i32 %26 to i64
  %28 = lshr exact i64 %25, %27
  %29 = lshr i64 %22, 46
  %30 = trunc i64 %29 to i16
  %31 = and i16 %30, 127
  %32 = getelementptr inbounds nuw i16, ptr @_ZN4libm4math7generic4sqrt9RSQRT_TAB17h29145966abca1189E, i16 %31
  %33 = load i16, ptr %32, align 2, !noalias !49, !noundef !1
  %34 = zext i16 %33 to i32
  %35 = shl nuw i32 %34, 16
  %36 = lshr i64 %28, 32
  %37 = trunc nuw i64 %36 to i32
  br label %38

38:                                               ; preds = %38, %21
  %39 = phi i32 [ %61, %38 ], [ %35, %21 ]
  %40 = phi i32 [ %56, %38 ], [ %35, %21 ]
  %41 = phi i32 [ %50, %38 ], [ %37, %21 ]
  %42 = phi i1 [ true, %38 ], [ false, %21 ]
  %43 = phi i1 [ false, %38 ], [ true, %21 ]
  %44 = zext i32 %41 to i64
  %45 = zext i32 %40 to i64
  %46 = mul nuw i64 %44, %45
  %47 = lshr i64 %46, 32
  %48 = trunc nuw i64 %47 to i32
  %49 = zext i1 %42 to i32
  %50 = shl i32 %48, %49
  %51 = zext i32 %50 to i64
  %52 = zext i32 %39 to i64
  %53 = mul nuw i64 %51, %52
  %54 = lshr i64 %53, 32
  %55 = trunc nuw i64 %54 to i32
  %56 = sub i32 -1073741824, %55
  %57 = zext i32 %56 to i64
  %58 = mul nuw i64 %57, %52
  %59 = lshr i64 %58, 31
  %60 = trunc i64 %59 to i32
  %61 = and i32 %60, -2
  br i1 %43, label %38, label %62

62:                                               ; preds = %38
  %.lcssa4 = phi i64 [ %59, %38 ]
  %63 = shl i64 %.lcssa4, 32
  %64 = and i64 %63, -8589934592
  br label %65

65:                                               ; preds = %65, %62
  %66 = phi i64 [ %64, %62 ], [ %84, %65 ]
  %67 = phi i64 [ %64, %62 ], [ %79, %65 ]
  %68 = phi i64 [ %28, %62 ], [ %74, %65 ]
  %69 = phi i1 [ true, %62 ], [ false, %65 ]
  %70 = zext i64 %68 to i128
  %71 = zext i64 %67 to i128
  %72 = mul nuw i128 %70, %71
  %73 = lshr i128 %72, 64
  %74 = trunc nuw i128 %73 to i64
  %75 = zext i64 %66 to i128
  %76 = mul nuw i128 %73, %75
  %77 = lshr i128 %76, 64
  %78 = trunc nuw i128 %77 to i64
  %79 = sub i64 -4611686018427387904, %78
  %80 = zext i64 %79 to i128
  %81 = mul nuw i128 %80, %75
  %82 = lshr i128 %81, 63
  %83 = trunc i128 %82 to i64
  %84 = and i64 %83, -2
  br i1 %69, label %65, label %85

85:                                               ; preds = %65
  %.lcssa = phi i64 [ %74, %65 ]
  %86 = add nsw i32 %23, 1023
  %87 = lshr i32 %86, 1
  %88 = lshr i64 %.lcssa, 9
  %89 = shl i64 %28, 42
  %90 = mul i64 %88, %88
  %91 = sub i64 %90, %89
  %92 = add i64 %91, %88
  %93 = lshr i64 %92, 63
  %94 = add nuw nsw i64 %93, %88
  %95 = and i64 %94, 4503599627370495
  %96 = zext nneg i32 %87 to i64
  %97 = shl nuw i64 %96, 52
  %98 = or disjoint i64 %95, %97
  %99 = add i64 %92, 1
  %100 = add i64 %99, %98
  %101 = icmp eq i64 %100, 0
  %102 = select i1 %101, i64 0, i64 4503599627370496
  %103 = xor i64 %100, %92
  %104 = and i64 %103, -9223372036854775808
  %105 = or disjoint i64 %102, %104
  %106 = bitcast i64 %105 to double
  %107 = bitcast i64 %98 to double
  %108 = fadd double %107, %106
  br label %109

109:                                              ; preds = %85, %12, %8
  %110 = phi double [ %108, %85 ], [ %1, %8 ], [ 0x7FF8000000000000, %12 ]
  store double %110, ptr %0, align 2, !alias.scope !46
  ret void
}

; Function Attrs: nounwind optsize
define dso_local noundef i16 @_critical_section_1_0_acquire() unnamed_addr #13 {
  %1 = tail call noundef i16 asm sideeffect "mov R2, ${0}", "=&r"() #17, !srcloc !52
  tail call void asm sideeffect "dint { nop", "~{sr},~{memory}"() #15, !srcloc !53
  ret i16 %1
}

; Function Attrs: nounwind optsize
define dso_local void @_critical_section_1_0_release(i16 noundef %0) unnamed_addr #13 {
  %2 = and i16 %0, 8
  %3 = icmp eq i16 %2, 0
  br i1 %3, label %5, label %4

4:                                                ; preds = %1
  tail call void asm sideeffect "nop { eint { nop", "~{sr},~{memory}"() #15, !srcloc !54
  br label %5

5:                                                ; preds = %4, %1
  ret void
}

; Function Attrs: noreturn nounwind optsize
declare dso_local msp430_intrcc void @Reset() unnamed_addr #6

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define dso_local void @PreInit_() unnamed_addr #14 {
  ret void
}

; Function Attrs: noreturn nounwind optsize
define dso_local msp430_intrcc void @DefaultHandler_() unnamed_addr #6 {
  br label %1

1:                                                ; preds = %1, %0
  tail call void asm sideeffect "", "~{memory}"() #15, !srcloc !55
  br label %1
}

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @LEA() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @PORT8() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @PORT7() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @EUSCI_B3() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @EUSCI_B2() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @EUSCI_B1() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @EUSCI_A3() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @EUSCI_A2() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @PORT6() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @PORT5() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER4_A1() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER4_A0() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @AES256() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @RTC_C() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @PORT4() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @PORT3() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER3_A1() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER3_A0() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @PORT2() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER2_A1() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER2_A0() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @PORT1() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER1_A1() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER1_A0() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @DMA() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @EUSCI_A1() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER0_A1() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @ADC12_B() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @EUSCI_B0() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @EUSCI_A0() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @WDT() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER0_B1() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER0_B0() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @COMP_E() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @UNMI() unnamed_addr #13

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @SYSNMI() unnamed_addr #13

attributes #0 = { mustprogress nofree norecurse nounwind optsize willreturn memory(readwrite, argmem: none) "target-cpu"="generic" }
attributes #1 = { nofree norecurse nosync nounwind optsize memory(argmem: readwrite) "target-cpu"="generic" }
attributes #2 = { nofree norecurse nosync nounwind optsize memory(argmem: readwrite, inaccessiblemem: readwrite) "target-cpu"="generic" }
attributes #3 = { nofree norecurse nounwind optsize "target-cpu"="generic" }
attributes #4 = { nofree norecurse nounwind optsize memory(readwrite, argmem: none) "target-cpu"="generic" }
attributes #5 = { cold noreturn nounwind optsize "target-cpu"="generic" }
attributes #6 = { noreturn nounwind optsize "target-cpu"="generic" }
attributes #7 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #9 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #10 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #11 = { cold noinline noreturn nounwind optsize "target-cpu"="generic" }
attributes #12 = { nofree norecurse nosync nounwind optsize memory(argmem: write, inaccessiblemem: readwrite) "target-cpu"="generic" }
attributes #13 = { nounwind optsize "target-cpu"="generic" }
attributes #14 = { mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none) "target-cpu"="generic" }
attributes #15 = { nounwind }
attributes #16 = { noreturn nounwind }
attributes #17 = { nounwind memory(inaccessiblemem: readwrite) }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0}

!0 = !{!"rustc version 1.89.0-nightly (283db70ac 2025-05-25)"}
!1 = !{}
!2 = !{!3}
!3 = distinct !{!3, !4, !"_ZN20activity_recognition13warmup_sensor17h54aba2b1d6edc7ccE: %seed"}
!4 = distinct !{!4, !"_ZN20activity_recognition13warmup_sensor17h54aba2b1d6edc7ccE"}
!5 = !{!6, !3}
!6 = distinct !{!6, !7, !"_ZN20activity_recognition12accel_sample17h1160811241037ba6E: %nv_seed"}
!7 = distinct !{!7, !"_ZN20activity_recognition12accel_sample17h1160811241037ba6E"}
!8 = !{!9}
!9 = distinct !{!9, !7, !"_ZN20activity_recognition12accel_sample17h1160811241037ba6E: %result"}
!10 = !{!6}
!11 = !{!9, !6, !3}
!12 = !{!13}
!13 = distinct !{!13, !14, !"_ZN20activity_recognition14acquire_window17hf377e5c9b9bab393E: %window"}
!14 = distinct !{!14, !"_ZN20activity_recognition14acquire_window17hf377e5c9b9bab393E"}
!15 = !{!16}
!16 = distinct !{!16, !14, !"_ZN20activity_recognition14acquire_window17hf377e5c9b9bab393E: %seed"}
!17 = !{!18}
!18 = distinct !{!18, !19, !"_ZN20activity_recognition12accel_sample17h1160811241037ba6E: %nv_seed"}
!19 = distinct !{!19, !"_ZN20activity_recognition12accel_sample17h1160811241037ba6E"}
!20 = !{!21, !18, !13, !16}
!21 = distinct !{!21, !19, !"_ZN20activity_recognition12accel_sample17h1160811241037ba6E: %result"}
!22 = !{!18, !16}
!23 = !{!21, !13}
!24 = !{i64 4774277057410588}
!25 = !{!26}
!26 = distinct !{!26, !27, !"_ZN20activity_recognition11select_mode17hd78e186901c08cdeE: %prev_pin_state"}
!27 = distinct !{!27, !"_ZN20activity_recognition11select_mode17hd78e186901c08cdeE"}
!28 = !{!29}
!29 = distinct !{!29, !30, !"_ZN20activity_recognition9recognize17hb04c457971b043f5E: %seed"}
!30 = distinct !{!30, !"_ZN20activity_recognition9recognize17hb04c457971b043f5E"}
!31 = !{!32}
!32 = distinct !{!32, !33, !"_ZN20activity_recognition14acquire_window17hf377e5c9b9bab393E: %window"}
!33 = distinct !{!33, !"_ZN20activity_recognition14acquire_window17hf377e5c9b9bab393E"}
!34 = !{!35}
!35 = distinct !{!35, !33, !"_ZN20activity_recognition14acquire_window17hf377e5c9b9bab393E: %seed"}
!36 = !{!37}
!37 = distinct !{!37, !38, !"_ZN20activity_recognition12accel_sample17h1160811241037ba6E: %nv_seed"}
!38 = distinct !{!38, !"_ZN20activity_recognition12accel_sample17h1160811241037ba6E"}
!39 = !{!40, !37, !32, !35, !29}
!40 = distinct !{!40, !38, !"_ZN20activity_recognition12accel_sample17h1160811241037ba6E: %result"}
!41 = !{!35, !29}
!42 = !{!37, !35, !29}
!43 = !{!40, !32}
!44 = !{i64 3427963723591084}
!45 = !{i64 3441183632931261}
!46 = !{!47}
!47 = distinct !{!47, !48, !"_ZN4libm4math7generic4sqrt4sqrt17h2b3018a68226d147E: argument 0"}
!48 = distinct !{!48, !"_ZN4libm4math7generic4sqrt4sqrt17h2b3018a68226d147E"}
!49 = !{!50, !47}
!50 = distinct !{!50, !51, !"_ZN4libm4math7generic4sqrt10sqrt_round17heec81aff78c9e4a4E: argument 0"}
!51 = distinct !{!51, !"_ZN4libm4math7generic4sqrt10sqrt_round17heec81aff78c9e4a4E"}
!52 = !{i64 38371237831387}
!53 = !{i64 17025250365297}
!54 = !{i64 20916490736372}
!55 = !{i64 3376505720405738}
