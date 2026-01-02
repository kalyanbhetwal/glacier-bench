; ModuleID = 'activity_recognition.bd143b7caa629158-cgu.0'
source_filename = "activity_recognition.bd143b7caa629158-cgu.0"
target datalayout = "e-m:e-p:16:16-i32:16-i64:16-f32:16-f64:16-a:8-n8:16-S16"
target triple = "msp430-unknown-none-elf"

%threeAxis_t_8 = type { i8, i8, i8 }
%features_t = type { i32, i32 }

@IO_NAME = dso_local local_unnamed_addr constant ptr @readSensor, align 2
@_ZN20activity_recognition12SENSOR_VALUE17h68811d6d7ef1959bE = internal global [1 x i8] zeroinitializer, align 1
@_ZN20activity_recognition11SENSOR_SEED17h8bbce9cf5de25225E = internal global [2 x i8] c"\01\00", align 2
@_ZN20activity_recognition16a2e08g0gfjin947716a2e08g0gfjin94778COUNT_NV17h31d971a6cebe5758E.0 = internal unnamed_addr global i16 1, section ".fram", align 2
@_ZN20activity_recognition16a2e08g0gfjin947716a2e08g0gfjin94778MODEL_NV17hca5d0bc54dcca426E = internal global [256 x i8] zeroinitializer, section ".fram", align 2
@_ZN20activity_recognition16a2e08g0gfjin947716a2e08g0gfjin94777SEED_NV17hdaf2501ddf8533dfE.0 = internal unnamed_addr global i16 1, section ".fram", align 2
@__RESET_VECTOR = dso_local local_unnamed_addr constant ptr @Reset, section ".__RESET_VECTOR", align 2
@__INTERRUPTS = dso_local constant <{ [52 x i8], ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }> <{ [52 x i8] zeroinitializer, ptr @LEA, ptr @PORT8, ptr @PORT7, ptr @EUSCI_B3, ptr @EUSCI_B2, ptr @EUSCI_B1, ptr @EUSCI_A3, ptr @EUSCI_A2, ptr @PORT6, ptr @PORT5, ptr @TIMER4_A1, ptr @TIMER4_A0, ptr @AES256, ptr @RTC_C, ptr @PORT4, ptr @PORT3, ptr @TIMER3_A1, ptr @TIMER3_A0, ptr @PORT2, ptr @TIMER2_A1, ptr @TIMER2_A0, ptr @PORT1, ptr @TIMER1_A1, ptr @TIMER1_A0, ptr @DMA, ptr @EUSCI_A1, ptr @TIMER0_A1, ptr @TIMER0_A0, ptr @ADC12_B, ptr @EUSCI_B0, ptr @EUSCI_A0, ptr @WDT, ptr @TIMER0_B1, ptr @TIMER0_B0, ptr @COMP_E, ptr @UNMI, ptr @SYSNMI }>, section ".vector_table.interrupts", align 2
@DEVICE_PERIPHERALS = dso_local local_unnamed_addr global [1 x i8] zeroinitializer, align 1
@llvm.compiler.used = appending global [1 x ptr] [ptr @__INTERRUPTS], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nounwind optsize willreturn memory(readwrite, argmem: none)
define dso_local noundef i8 @readSensor(i16 %_input) unnamed_addr #0 {
start:
  %0 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h68811d6d7ef1959bE, align 1
  ret i8 %0
}

; activity_recognition::transform
; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define internal fastcc void @_ZN20activity_recognition9transform17hecabce47625d462bE(ptr noalias nocapture noundef nonnull align 1 dereferenceable(9) %window) unnamed_addr #1 {
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
; Function Attrs: nofree norecurse nosync nounwind optsize memory(argmem: readwrite)
define internal fastcc void @_ZN20activity_recognition9featurize17he72c78a4b0614199E(ptr noalias nocapture noundef nonnull writeonly align 2 dereferenceable(8) %features, ptr noalias nocapture noundef nonnull readonly align 1 dereferenceable(9) %aWin) unnamed_addr #1 {
start:
  br label %bb7

bb6:                                              ; preds = %bb7
  %.lcssa117 = phi i8 [ %20, %bb7 ]
  %.lcssa116 = phi i8 [ %22, %bb7 ]
  %.lcssa115 = phi i8 [ %24, %bb7 ]
  %0 = lshr i8 %.lcssa117, 2
  %1 = lshr i8 %.lcssa116, 2
  %2 = lshr i8 %.lcssa115, 2
  br label %bb15

bb14:                                             ; preds = %bb15
  %.lcssa114 = phi i8 [ %10, %bb15 ]
  %.lcssa113 = phi i8 [ %14, %bb15 ]
  %.lcssa = phi i8 [ %18, %bb15 ]
  %3 = lshr i8 %.lcssa114, 2
  %4 = lshr i8 %.lcssa113, 2
  %5 = lshr i8 %.lcssa, 2
  %_47 = zext nneg i8 %0 to i32
  %_46 = mul nuw nsw i32 %_47, %_47
  %_52 = zext nneg i8 %1 to i32
  %_51 = mul nuw nsw i32 %_52, %_52
  %_45 = add nuw nsw i32 %_46, %_51
  %_57 = zext nneg i8 %2 to i32
  %_56 = mul nuw nsw i32 %_57, %_57
  %meanmag = add nuw nsw i32 %_45, %_56
  %_64 = zext nneg i8 %3 to i32
  %_63 = mul nuw nsw i32 %_64, %_64
  %_69 = zext nneg i8 %4 to i32
  %_68 = mul nuw nsw i32 %_69, %_69
  %_62 = add nuw nsw i32 %_68, %_63
  %_74 = zext nneg i8 %5 to i32
  %_73 = mul nuw nsw i32 %_74, %_74
  %stddevmag = add nuw nsw i32 %_62, %_73
  store i32 %meanmag, ptr %features, align 2
  %6 = getelementptr inbounds nuw i8, ptr %features, i16 4
  store i32 %stddevmag, ptr %6, align 2
  ret void

bb15:                                             ; preds = %bb6, %bb15
  %stddev5.sroa.0.076 = phi i8 [ 0, %bb6 ], [ %18, %bb15 ]
  %stddev4.sroa.0.075 = phi i8 [ 0, %bb6 ], [ %14, %bb15 ]
  %stddev.sroa.0.074 = phi i8 [ 0, %bb6 ], [ %10, %bb15 ]
  %iter1.sroa.0.073 = phi i16 [ 0, %bb6 ], [ %_0.i.i.i.i61, %bb15 ]
  %_0.i.i.i.i61 = add nuw nsw i16 %iter1.sroa.0.073, 1
  %7 = getelementptr inbounds nuw %threeAxis_t_8, ptr %aWin, i16 %iter1.sroa.0.073
  %_21 = load i8, ptr %7, align 1, !noundef !1
  %_20 = icmp ugt i8 %_21, %0
  %8 = sub i8 %_21, %0
  %9 = sub nsw i8 %0, %_21
  %_19.sroa.0.0 = select i1 %_20, i8 %8, i8 %9
  %10 = add i8 %_19.sroa.0.0, %stddev.sroa.0.074
  %11 = getelementptr inbounds nuw i8, ptr %7, i16 1
  %_30 = load i8, ptr %11, align 1, !noundef !1
  %_29 = icmp ugt i8 %_30, %1
  %12 = sub i8 %_30, %1
  %13 = sub nsw i8 %1, %_30
  %_28.sroa.0.0 = select i1 %_29, i8 %12, i8 %13
  %14 = add i8 %_28.sroa.0.0, %stddev4.sroa.0.075
  %15 = getelementptr inbounds nuw i8, ptr %7, i16 2
  %_38 = load i8, ptr %15, align 1, !noundef !1
  %_37 = icmp ugt i8 %_38, %2
  %16 = sub i8 %_38, %2
  %17 = sub nsw i8 %2, %_38
  %_36.sroa.0.0 = select i1 %_37, i8 %16, i8 %17
  %18 = add i8 %_36.sroa.0.0, %stddev5.sroa.0.076
  %exitcond82.not = icmp eq i16 %_0.i.i.i.i61, 3
  br i1 %exitcond82.not, label %bb14, label %bb15

bb7:                                              ; preds = %start, %bb7
  %mean3.sroa.0.072 = phi i8 [ 0, %start ], [ %24, %bb7 ]
  %mean.sroa.0.071 = phi i8 [ 0, %start ], [ %20, %bb7 ]
  %mean2.sroa.0.070 = phi i8 [ 0, %start ], [ %22, %bb7 ]
  %iter.sroa.0.069 = phi i16 [ 0, %start ], [ %_0.i.i.i.i, %bb7 ]
  %_0.i.i.i.i = add nuw nsw i16 %iter.sroa.0.069, 1
  %19 = getelementptr inbounds nuw %threeAxis_t_8, ptr %aWin, i16 %iter.sroa.0.069
  %_9 = load i8, ptr %19, align 1, !noundef !1
  %20 = add i8 %_9, %mean.sroa.0.071
  %21 = getelementptr inbounds nuw i8, ptr %19, i16 1
  %_11 = load i8, ptr %21, align 1, !noundef !1
  %22 = add i8 %_11, %mean2.sroa.0.070
  %23 = getelementptr inbounds nuw i8, ptr %19, i16 2
  %_12 = load i8, ptr %23, align 1, !noundef !1
  %24 = add i8 %_12, %mean3.sroa.0.072
  %exitcond.not = icmp eq i16 %_0.i.i.i.i, 3
  br i1 %exitcond.not, label %bb6, label %bb7
}

; activity_recognition::train
; Function Attrs: nofree norecurse nounwind optsize
define internal fastcc void @_ZN20activity_recognition5train17ha84e3cf87731bf5cE(ptr noalias nocapture noundef writeonly align 2 dereferenceable(128) %classModel, ptr noalias nocapture noundef nonnull align 2 dereferenceable(2) %seed) unnamed_addr #2 {
start:
  %features = alloca [8 x i8], align 2
  %sampleWindow = alloca [9 x i8], align 1
  call void @llvm.lifetime.start.p0(i64 9, ptr nonnull %sampleWindow)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(9) %sampleWindow, i8 0, i64 9, i1 false)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %features)
  store i32 0, ptr %features, align 2
  %0 = getelementptr inbounds nuw i8, ptr %features, i16 4
  store i32 0, ptr %0, align 2
  tail call void @llvm.experimental.noalias.scope.decl(metadata !2)
  %seed.promoted.i = load i16, ptr %seed, align 2, !alias.scope !5, !noalias !8
  br label %bb2.i

bb2.i:                                            ; preds = %bb2.i, %start
  %discardedSamplesCount.sroa.0.04.i = phi i16 [ 0, %start ], [ %4, %bb2.i ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !10)
  %1 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h68811d6d7ef1959bE, align 1, !noalias !11
  %2 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h68811d6d7ef1959bE, align 1, !noalias !11
  %3 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h68811d6d7ef1959bE, align 1, !noalias !11
  %4 = add nuw nsw i16 %discardedSamplesCount.sroa.0.04.i, 1
  %exitcond.not.i = icmp eq i16 %4, 3
  br i1 %exitcond.not.i, label %_ZN20activity_recognition13warmup_sensor17hb4d3ca25e3d01749E.exit, label %bb2.i

_ZN20activity_recognition13warmup_sensor17hb4d3ca25e3d01749E.exit: ; preds = %bb2.i
  %5 = add i16 %seed.promoted.i, 3
  br label %bb6

bb6:                                              ; preds = %_ZN20activity_recognition13warmup_sensor17hb4d3ca25e3d01749E.exit, %_ZN20activity_recognition14acquire_window17hb91e4855836b3abaE.exit
  %iter.sroa.0.019 = phi i16 [ 0, %_ZN20activity_recognition13warmup_sensor17hb4d3ca25e3d01749E.exit ], [ %_0.i.i.i.i, %_ZN20activity_recognition14acquire_window17hb91e4855836b3abaE.exit ]
  %6 = phi i16 [ %5, %_ZN20activity_recognition13warmup_sensor17hb4d3ca25e3d01749E.exit ], [ %12, %_ZN20activity_recognition14acquire_window17hb91e4855836b3abaE.exit ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !12)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !15)
  br label %bb2.i14

bb2.i14:                                          ; preds = %bb2.i14, %bb6
  %samplesInWindow.sroa.0.03.i = phi i16 [ 0, %bb6 ], [ %11, %bb2.i14 ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !17)
  %7 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h68811d6d7ef1959bE, align 1, !noalias !20
  %8 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h68811d6d7ef1959bE, align 1, !noalias !20
  %9 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h68811d6d7ef1959bE, align 1, !noalias !20
  %10 = getelementptr inbounds nuw %threeAxis_t_8, ptr %sampleWindow, i16 %samplesInWindow.sroa.0.03.i
  store i8 %7, ptr %10, align 1, !alias.scope !12, !noalias !15
  %sample.sroa.2.0..sroa_idx.i = getelementptr inbounds nuw i8, ptr %10, i16 1
  store i8 %8, ptr %sample.sroa.2.0..sroa_idx.i, align 1, !alias.scope !12, !noalias !15
  %sample.sroa.3.0..sroa_idx.i = getelementptr inbounds nuw i8, ptr %10, i16 2
  store i8 %9, ptr %sample.sroa.3.0..sroa_idx.i, align 1, !alias.scope !12, !noalias !15
  %11 = add nuw nsw i16 %samplesInWindow.sroa.0.03.i, 1
  %exitcond.not.i15 = icmp eq i16 %11, 3
  br i1 %exitcond.not.i15, label %_ZN20activity_recognition14acquire_window17hb91e4855836b3abaE.exit, label %bb2.i14

_ZN20activity_recognition14acquire_window17hb91e4855836b3abaE.exit: ; preds = %bb2.i14
  %_0.i.i.i.i = add nuw nsw i16 %iter.sroa.0.019, 1
  %12 = add i16 %6, 3
  store i16 %12, ptr %seed, align 2, !alias.scope !22, !noalias !23
; call activity_recognition::transform
  call fastcc void @_ZN20activity_recognition9transform17hecabce47625d462bE(ptr noalias noundef align 1 dereferenceable(9) %sampleWindow) #12
; call activity_recognition::featurize
  call fastcc void @_ZN20activity_recognition9featurize17he72c78a4b0614199E(ptr noalias noundef align 2 dereferenceable(8) %features, ptr noalias noundef readonly align 1 dereferenceable(9) %sampleWindow) #12
  %_20 = load i32, ptr %features, align 2, !noundef !1
  %13 = getelementptr inbounds nuw %features_t, ptr %classModel, i16 %iter.sroa.0.019
  store i32 %_20, ptr %13, align 2
  %_22 = load i32, ptr %0, align 2, !noundef !1
  %14 = getelementptr inbounds nuw i8, ptr %13, i16 4
  store i32 %_22, ptr %14, align 2
  %exitcond.not = icmp eq i16 %_0.i.i.i.i, 16
  br i1 %exitcond.not, label %bb7, label %bb6

bb7:                                              ; preds = %_ZN20activity_recognition14acquire_window17hb91e4855836b3abaE.exit
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %features)
  call void @llvm.lifetime.end.p0(i64 9, ptr nonnull %sampleWindow)
  ret void
}

; Function Attrs: nofree norecurse nounwind optsize memory(readwrite, argmem: none)
define dso_local msp430_intrcc void @TIMER0_A0() unnamed_addr #3 {
start:
  %0 = load volatile i16, ptr @_ZN20activity_recognition11SENSOR_SEED17h8bbce9cf5de25225E, align 2
  %1 = trunc i16 %0 to i8
  %2 = mul i8 %1, 13
  %3 = add i8 %2, 7
  %_0.i1 = and i8 %3, 127
  store volatile i8 %_0.i1, ptr @_ZN20activity_recognition12SENSOR_VALUE17h68811d6d7ef1959bE, align 1
  %_0.i = add i16 %0, 1
  store volatile i16 %_0.i, ptr @_ZN20activity_recognition11SENSOR_SEED17h8bbce9cf5de25225E, align 2
  ret void
}

; Function Attrs: cold noreturn nounwind optsize
define dso_local void @abort() unnamed_addr #4 {
start:
; call core::panicking::panic
  tail call fastcc void @_ZN4core9panicking5panic17h771a552b74645b72E() #13
  unreachable
}

; Function Attrs: noreturn nounwind optsize
define dso_local void @main() unnamed_addr #5 {
start:
  %features.i = alloca [8 x i8], align 2
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
  tail call void asm sideeffect "nop { eint { nop", "~{sr},~{memory}"() #12, !srcloc !24
  %.pre = load i16, ptr @_ZN20activity_recognition16a2e08g0gfjin947716a2e08g0gfjin94777SEED_NV17hdaf2501ddf8533dfE.0, align 2
  br label %bb2.i

bb2.i:                                            ; preds = %bb18.i, %start
  %4 = phi i16 [ %.pre, %start ], [ %_23.i, %bb18.i ]
  %prev_pin_state.i.sroa.0.0 = phi i8 [ 3, %start ], [ %prev_pin_state.i.sroa.0.1, %bb18.i ]
  call void @llvm.lifetime.start.p0(i64 2, ptr nonnull %localSeed.i)
  store i16 %4, ptr %localSeed.i, align 2
  %_4.i = load i16, ptr @_ZN20activity_recognition16a2e08g0gfjin947716a2e08g0gfjin94778COUNT_NV17h31d971a6cebe5758E.0, align 2, !noalias !25, !noundef !1
  %5 = add i16 %_4.i, 1
  store i16 %5, ptr @_ZN20activity_recognition16a2e08g0gfjin947716a2e08g0gfjin94778COUNT_NV17h31d971a6cebe5758E.0, align 2, !noalias !25
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
  call fastcc void @_ZN20activity_recognition5train17ha84e3cf87731bf5cE(ptr noalias noundef nonnull align 2 dereferenceable(128) @_ZN20activity_recognition16a2e08g0gfjin947716a2e08g0gfjin94778MODEL_NV17hca5d0bc54dcca426E, ptr noalias noundef align 2 dereferenceable(2) %localSeed.i) #12
  br label %bb18.i

bb18.i:                                           ; preds = %bb12.i1.thread, %bb1.i, %bb12.i1, %bb12.i, %_ZN20activity_recognition9recognize17h09b903b76e1f2459E.exit, %bb6.i, %bb4.i
  %prev_pin_state.i.sroa.0.1 = phi i8 [ 3, %bb12.i ], [ 0, %_ZN20activity_recognition9recognize17h09b903b76e1f2459E.exit ], [ 1, %bb6.i ], [ 2, %bb4.i ], [ 2, %bb12.i1 ], [ 3, %bb1.i ], [ 1, %bb12.i1.thread ]
  %_23.i = load i16, ptr %localSeed.i, align 2, !noundef !1
  store i16 %_23.i, ptr @_ZN20activity_recognition16a2e08g0gfjin947716a2e08g0gfjin94777SEED_NV17hdaf2501ddf8533dfE.0, align 2
  call void @llvm.lifetime.end.p0(i64 2, ptr nonnull %localSeed.i)
  br label %bb2.i

bb6.i:                                            ; preds = %bb12.i1.thread
; call activity_recognition::train
  call fastcc void @_ZN20activity_recognition5train17ha84e3cf87731bf5cE(ptr noalias noundef nonnull align 2 dereferenceable(128) getelementptr inbounds nuw (i8, ptr @_ZN20activity_recognition16a2e08g0gfjin947716a2e08g0gfjin94778MODEL_NV17hca5d0bc54dcca426E, i16 128), ptr noalias noundef align 2 dereferenceable(2) %localSeed.i) #12
  br label %bb18.i

bb8.i:                                            ; preds = %bb2.i, %bb2.i
  tail call void @llvm.experimental.noalias.scope.decl(metadata !28)
  call void @llvm.lifetime.start.p0(i64 9, ptr nonnull %sampleWindow.i), !noalias !28
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(9) %sampleWindow.i, i8 0, i64 9, i1 false), !noalias !28
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %features.i), !noalias !28
  br label %bb5.i

bb5.i:                                            ; preds = %_ZN20activity_recognition14acquire_window17hb91e4855836b3abaE.exit.i, %bb8.i
  %stats.sroa.0.023.i = phi i16 [ 0, %bb8.i ], [ %12, %_ZN20activity_recognition14acquire_window17hb91e4855836b3abaE.exit.i ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !31)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !34)
  br label %bb2.i.i

bb2.i.i:                                          ; preds = %bb2.i.i, %bb5.i
  %samplesInWindow.sroa.0.03.i.i = phi i16 [ 0, %bb5.i ], [ %11, %bb2.i.i ]
  tail call void @llvm.experimental.noalias.scope.decl(metadata !36)
  %7 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h68811d6d7ef1959bE, align 1, !noalias !39
  %8 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h68811d6d7ef1959bE, align 1, !noalias !39
  %9 = load volatile i8, ptr @_ZN20activity_recognition12SENSOR_VALUE17h68811d6d7ef1959bE, align 1, !noalias !39
  %10 = getelementptr inbounds nuw %threeAxis_t_8, ptr %sampleWindow.i, i16 %samplesInWindow.sroa.0.03.i.i
  store i8 %7, ptr %10, align 1, !alias.scope !31, !noalias !41
  %sample.sroa.2.0..sroa_idx.i.i = getelementptr inbounds nuw i8, ptr %10, i16 1
  store i8 %8, ptr %sample.sroa.2.0..sroa_idx.i.i, align 1, !alias.scope !31, !noalias !41
  %sample.sroa.3.0..sroa_idx.i.i = getelementptr inbounds nuw i8, ptr %10, i16 2
  store i8 %9, ptr %sample.sroa.3.0..sroa_idx.i.i, align 1, !alias.scope !31, !noalias !41
  %11 = add nuw nsw i16 %samplesInWindow.sroa.0.03.i.i, 1
  %exitcond.not.i.i = icmp eq i16 %11, 3
  br i1 %exitcond.not.i.i, label %_ZN20activity_recognition14acquire_window17hb91e4855836b3abaE.exit.i, label %bb2.i.i

_ZN20activity_recognition14acquire_window17hb91e4855836b3abaE.exit.i: ; preds = %bb2.i.i
; call activity_recognition::transform
  call fastcc void @_ZN20activity_recognition9transform17hecabce47625d462bE(ptr noalias noundef align 1 dereferenceable(9) %sampleWindow.i) #12, !noalias !28
; call activity_recognition::featurize
  call fastcc void @_ZN20activity_recognition9featurize17he72c78a4b0614199E(ptr noalias noundef align 2 dereferenceable(8) %features.i, ptr noalias noundef readonly align 1 dereferenceable(9) %sampleWindow.i) #12, !noalias !28
  %12 = add nuw nsw i16 %stats.sroa.0.023.i, 1
  %exitcond.not.i = icmp eq i16 %12, 128
  br i1 %exitcond.not.i, label %_ZN20activity_recognition9recognize17h09b903b76e1f2459E.exit, label %bb5.i

_ZN20activity_recognition9recognize17h09b903b76e1f2459E.exit: ; preds = %_ZN20activity_recognition14acquire_window17hb91e4855836b3abaE.exit.i
  %13 = add i16 %4, 384
  store i16 %13, ptr %localSeed.i, align 2, !alias.scope !42, !noalias !43
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %features.i), !noalias !28
  call void @llvm.lifetime.end.p0(i64 9, ptr nonnull %sampleWindow.i), !noalias !28
  br label %bb18.i

bb12.i:                                           ; preds = %bb1.i, %bb2.i
  store i16 1, ptr %localSeed.i, align 2
  store i16 1, ptr @_ZN20activity_recognition16a2e08g0gfjin947716a2e08g0gfjin94778COUNT_NV17h31d971a6cebe5758E.0, align 2
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #6

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #6

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #7

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #8

; core::panicking::panic_fmt
; Function Attrs: cold noinline noreturn nounwind optsize
define internal fastcc void @_ZN4core9panicking9panic_fmt17hb4e8523a0c852053E() unnamed_addr #9 {
  tail call void asm sideeffect "dint { nop", "~{sr},~{memory}"() #12, !srcloc !44
  br label %1

1:                                                ; preds = %1, %0
  tail call void asm sideeffect "", "~{memory}"() #12, !srcloc !45
  br label %1
}

; core::panicking::panic
; Function Attrs: cold noinline noreturn nounwind optsize
define internal fastcc void @_ZN4core9panicking5panic17h771a552b74645b72E() unnamed_addr #9 {
; call core::panicking::panic_fmt
  tail call fastcc void @_ZN4core9panicking9panic_fmt17hb4e8523a0c852053E() #13
  unreachable
}

; Function Attrs: nounwind optsize
define dso_local noundef i16 @_critical_section_1_0_acquire() unnamed_addr #10 {
  %1 = tail call noundef i16 asm sideeffect "mov R2, ${0}", "=&r"() #14, !srcloc !46
  tail call void asm sideeffect "dint { nop", "~{sr},~{memory}"() #12, !srcloc !47
  ret i16 %1
}

; Function Attrs: nounwind optsize
define dso_local void @_critical_section_1_0_release(i16 noundef %0) unnamed_addr #10 {
  %2 = and i16 %0, 8
  %3 = icmp eq i16 %2, 0
  br i1 %3, label %5, label %4

4:                                                ; preds = %1
  tail call void asm sideeffect "nop { eint { nop", "~{sr},~{memory}"() #12, !srcloc !48
  br label %5

5:                                                ; preds = %4, %1
  ret void
}

; Function Attrs: noreturn nounwind optsize
declare dso_local msp430_intrcc void @Reset() unnamed_addr #5

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none)
define dso_local void @PreInit_() unnamed_addr #11 {
  ret void
}

; Function Attrs: noreturn nounwind optsize
define dso_local msp430_intrcc void @DefaultHandler_() unnamed_addr #5 {
  br label %1

1:                                                ; preds = %1, %0
  tail call void asm sideeffect "", "~{memory}"() #12, !srcloc !49
  br label %1
}

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @LEA() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @PORT8() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @PORT7() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @EUSCI_B3() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @EUSCI_B2() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @EUSCI_B1() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @EUSCI_A3() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @EUSCI_A2() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @PORT6() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @PORT5() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER4_A1() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER4_A0() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @AES256() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @RTC_C() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @PORT4() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @PORT3() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER3_A1() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER3_A0() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @PORT2() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER2_A1() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER2_A0() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @PORT1() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER1_A1() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER1_A0() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @DMA() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @EUSCI_A1() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER0_A1() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @ADC12_B() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @EUSCI_B0() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @EUSCI_A0() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @WDT() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER0_B1() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @TIMER0_B0() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @COMP_E() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @UNMI() unnamed_addr #10

; Function Attrs: nounwind optsize
declare dso_local msp430_intrcc void @SYSNMI() unnamed_addr #10

attributes #0 = { mustprogress nofree norecurse nounwind optsize willreturn memory(readwrite, argmem: none) "target-cpu"="generic" }
attributes #1 = { nofree norecurse nosync nounwind optsize memory(argmem: readwrite) "target-cpu"="generic" }
attributes #2 = { nofree norecurse nounwind optsize "target-cpu"="generic" }
attributes #3 = { nofree norecurse nounwind optsize memory(readwrite, argmem: none) "target-cpu"="generic" }
attributes #4 = { cold noreturn nounwind optsize "target-cpu"="generic" }
attributes #5 = { noreturn nounwind optsize "target-cpu"="generic" }
attributes #6 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #8 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #9 = { cold noinline noreturn nounwind optsize "target-cpu"="generic" }
attributes #10 = { nounwind optsize "target-cpu"="generic" }
attributes #11 = { mustprogress nofree norecurse nosync nounwind optsize willreturn memory(none) "target-cpu"="generic" }
attributes #12 = { nounwind }
attributes #13 = { noreturn nounwind }
attributes #14 = { nounwind memory(inaccessiblemem: readwrite) }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0}

!0 = !{!"rustc version 1.89.0-nightly (283db70ac 2025-05-25)"}
!1 = !{}
!2 = !{!3}
!3 = distinct !{!3, !4, !"_ZN20activity_recognition13warmup_sensor17hb4d3ca25e3d01749E: %seed"}
!4 = distinct !{!4, !"_ZN20activity_recognition13warmup_sensor17hb4d3ca25e3d01749E"}
!5 = !{!6, !3}
!6 = distinct !{!6, !7, !"_ZN20activity_recognition12accel_sample17h3c0d8ec265719cfcE: %nv_seed"}
!7 = distinct !{!7, !"_ZN20activity_recognition12accel_sample17h3c0d8ec265719cfcE"}
!8 = !{!9}
!9 = distinct !{!9, !7, !"_ZN20activity_recognition12accel_sample17h3c0d8ec265719cfcE: %result"}
!10 = !{!6}
!11 = !{!9, !6, !3}
!12 = !{!13}
!13 = distinct !{!13, !14, !"_ZN20activity_recognition14acquire_window17hb91e4855836b3abaE: %window"}
!14 = distinct !{!14, !"_ZN20activity_recognition14acquire_window17hb91e4855836b3abaE"}
!15 = !{!16}
!16 = distinct !{!16, !14, !"_ZN20activity_recognition14acquire_window17hb91e4855836b3abaE: %seed"}
!17 = !{!18}
!18 = distinct !{!18, !19, !"_ZN20activity_recognition12accel_sample17h3c0d8ec265719cfcE: %nv_seed"}
!19 = distinct !{!19, !"_ZN20activity_recognition12accel_sample17h3c0d8ec265719cfcE"}
!20 = !{!21, !18, !13, !16}
!21 = distinct !{!21, !19, !"_ZN20activity_recognition12accel_sample17h3c0d8ec265719cfcE: %result"}
!22 = !{!18, !16}
!23 = !{!21, !13}
!24 = !{i64 4649048695931959}
!25 = !{!26}
!26 = distinct !{!26, !27, !"_ZN20activity_recognition11select_mode17h694364447b243138E: %prev_pin_state"}
!27 = distinct !{!27, !"_ZN20activity_recognition11select_mode17h694364447b243138E"}
!28 = !{!29}
!29 = distinct !{!29, !30, !"_ZN20activity_recognition9recognize17h09b903b76e1f2459E: %seed"}
!30 = distinct !{!30, !"_ZN20activity_recognition9recognize17h09b903b76e1f2459E"}
!31 = !{!32}
!32 = distinct !{!32, !33, !"_ZN20activity_recognition14acquire_window17hb91e4855836b3abaE: %window"}
!33 = distinct !{!33, !"_ZN20activity_recognition14acquire_window17hb91e4855836b3abaE"}
!34 = !{!35}
!35 = distinct !{!35, !33, !"_ZN20activity_recognition14acquire_window17hb91e4855836b3abaE: %seed"}
!36 = !{!37}
!37 = distinct !{!37, !38, !"_ZN20activity_recognition12accel_sample17h3c0d8ec265719cfcE: %nv_seed"}
!38 = distinct !{!38, !"_ZN20activity_recognition12accel_sample17h3c0d8ec265719cfcE"}
!39 = !{!40, !37, !32, !35, !29}
!40 = distinct !{!40, !38, !"_ZN20activity_recognition12accel_sample17h3c0d8ec265719cfcE: %result"}
!41 = !{!35, !29}
!42 = !{!37, !35, !29}
!43 = !{!40, !32}
!44 = !{i64 3427963723591084}
!45 = !{i64 3441183632931261}
!46 = !{i64 38371237831387}
!47 = !{i64 17025250365297}
!48 = !{i64 20916490736372}
!49 = !{i64 3376505720405738}
