---- ---- ---- ---- ---- ---- ---- ---- ---- ----
-- v1.1 2020.03.14 정민호
--  * '도로명주소_건물_도로명_코드' 테이블 pk 변경으로 인한 테이블 생성쿼리 수정
--   - 주소_시군구_주소코드 + 주소_읍면동_일련번호 -> 주소_시군구_주소코드 + 주소_도로_일련번호 + 주소_읍면동_일련번호
--  * 데이터 import 시 원할하게 입력하기 위해 원본 데이터 순서대로 컬럼 순서 변경
---- ---- ---- ---- ---- ---- ---- ---- ---- ----



CREATE TABLE ROWDATA_ADDR.TBL_RNA_BLD ( -- 도로명주소_건물 테이블		
	ADR_LGD_ACD VARCHAR(14)  ,  -- 주소_법정동_주소코드 - 주소코드_VAR14		
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200		
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200		
	ADR_LGL_EMD_NM VARCHAR(200)  ,  -- 주소_법정_읍면동_명칭 - 명칭_VAR200		
	ADR_LGL_LI_NM VARCHAR(200)  ,  -- 주소_법정_리_명칭 - 명칭_VAR200		
	ADR_MNT_CCD VARCHAR(2)  ,  -- 주소_산_구분코드 - 구분코드_VAR2		
	ADR_LTN_ORN_NMB INTEGER  ,  -- 주소_지번_본번_번호 - 번호_INT		
	ADR_LTN_VCN_NMB INTEGER  ,  -- 주소_지번_부번_번호 - 번호_INT		
	ADR_RD_ACD VARCHAR(14)  ,  -- 주소_도로_주소코드 - 주소코드_VAR14		
	ADR_RD_NM VARCHAR(200)  ,  -- 주소_도로_명칭 - 명칭_VAR200		
	ADR_UND_CCD VARCHAR(2)  ,  -- 주소_지하_구분코드 - 구분코드_VAR2		
	ADR_BLD_ORN_NMB INTEGER  ,  -- 주소_건물_본번_번호 - 번호_INT		
	ADR_BLD_VCN_NMB INTEGER  ,  -- 주소_건물_부번_번호 - 번호_INT		
	ADR_BDL_BLD_NM VARCHAR(200)  ,  -- 주소_건축물대장_건물_명칭 - 명칭_VAR200		
	ADR_DTL_BLD_NM VARCHAR(200)  ,  -- 주소_상세_건물_명칭 - 명칭_VAR200		
	ADR_BLD_MNN VARCHAR(25) NOT NULL ,  -- 주소_건물_관리번호 - 관리번호_VAR25	
	ADR_EMD_SRN VARCHAR(10)  ,  -- 주소_읍면동_일련번호 - 일련번호_VAR10		
	ADR_ADD_ACD VARCHAR(14)  ,  -- 주소_행정동_주소코드 - 주소코드_VAR14		
	ADR_ADD_NM VARCHAR(200)  ,  -- 주소_행정동_명칭 - 명칭_VAR200		
	ADR_ZPC VARCHAR(6)  ,  -- 주소_우편번호 - 우편번호_VAR6		
	ADR_PST_SRN VARCHAR(10)  ,  -- 주소_우편_일련번호 - 일련번호_VAR10		
	ADR_QNT_DLV_LCT_NM VARCHAR(200)  ,  -- 주소_다량_배달_위치_명칭 - 명칭_VAR200		
	ADR_MPO_CCD VARCHAR(2)  ,  -- 주소_이동사유_구분코드 - 구분코드_VAR2		
	ADR_NTF_OGD VARCHAR(8)  ,  -- 주소_고시_원본일자 - 원본일자_VAR8		
	ADR_CHN_BFR_RNA_NM VARCHAR(200)  ,  -- 주소_변경_이전_도로명주소_명칭 - 명칭_VAR200		
	ADR_SGG_BLD_NM VARCHAR(200)  ,  -- 주소_시군구_건물_명칭 - 명칭_VAR200		
	ADR_APT_CCD VARCHAR(2)  ,  -- 주소_공동주택_구분코드 - 구분코드_VAR2		
	ADR_SDS VARCHAR(5)  ,  -- 주소_국가기초구역번호 - 국가기초구역번호_VAR5		
	ADR_DTA_GRN_YN CHAR(1)  ,  -- 주소_상세주소_부여_여부 - 여부_CHR1		
	ADR_RM1_CNT VARCHAR(1000)  ,  -- 주소_비고1_내용 - 내용_VAR1000		
	ADR_RM2_CNT VARCHAR(1000)  ,  -- 주소_비고2_내용 - 내용_VAR1000		

	CONSTRAINT TBL_RNA_BLD_pkey PRIMARY KEY (ADR_BLD_MNN)	
);


CREATE TABLE ROWDATA_ADDR.TBL_RNA_BLD_RLT_LTN ( -- 도로명주소_건물_관련_지번 테이블		
	ADR_LGD_ACD VARCHAR(14)  ,  -- 주소_법정동_주소코드 - 주소코드_VAR14		
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200		
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200		
	ADR_LGL_EMD_NM VARCHAR(200)  ,  -- 주소_법정_읍면동_명칭 - 명칭_VAR200		
	ADR_LGL_LI_NM VARCHAR(200)  ,  -- 주소_법정_리_명칭 - 명칭_VAR200		
	ADR_MNT_CCD VARCHAR(2)  ,  -- 주소_산_구분코드 - 구분코드_VAR2		
	ADR_LTN_ORN_NMB INTEGER  ,  -- 주소_지번_본번_번호 - 번호_INT		
	ADR_LTN_VCN_NMB INTEGER  ,  -- 주소_지번_부번_번호 - 번호_INT		
	ADR_RD_ACD VARCHAR(14) NOT NULL ,  -- 주소_도로_주소코드 - 주소코드_VAR14	
	ADR_UND_CCD VARCHAR(2) NOT NULL ,  -- 주소_지하_구분코드 - 구분코드_VAR2		
	ADR_BLD_ORN_NMB INTEGER NOT NULL ,  -- 주소_건물_본번_번호 - 번호_INT		
	ADR_BLD_VCN_NMB INTEGER NOT NULL ,  -- 주소_건물_부번_번호 - 번호_INT		
	ADR_LTN_SRN VARCHAR(10) NOT NULL ,  -- 주소_지번_일련번호 - 일련번호_VAR10		
	ADR_MPO_CCD VARCHAR(2)  ,  -- 주소_이동사유_구분코드 - 구분코드_VAR2		

	CONSTRAINT TBL_RNA_BLD_RLT_LTN_pkey PRIMARY KEY (ADR_RD_ACD, ADR_UND_CCD, ADR_BLD_ORN_NMB, ADR_BLD_VCN_NMB, ADR_LTN_SRN)	
);


CREATE TABLE ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD ( -- 도로명주소_건물_도로명_코드 테이블		
	ADR_SGG_ACD VARCHAR(14) NOT NULL ,  -- 주소_시군구_주소코드 - 주소코드_VAR14	
	ADR_RD_SRN VARCHAR(10) NOT NULL ,  -- 주소_도로_일련번호 - 일련번호_VAR10		
	ADR_RD_NM VARCHAR(200)  ,  -- 주소_도로_명칭 - 명칭_VAR200		
	ADR_RD_WRE_NM VARCHAR(200)  ,  -- 주소_도로_영문_명칭 - 명칭_VAR200		
	ADR_EMD_SRN VARCHAR(10) NOT NULL ,  -- 주소_읍면동_일련번호 - 일련번호_VAR10	
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200		
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200		
	ADR_EMD_CCD VARCHAR(2)  ,  -- 주소_읍면동_구분코드 - 구분코드_VAR2		
	ADR_EMD_ACD VARCHAR(14)  ,  -- 주소_읍면동_주소코드 - 주소코드_VAR14		
	ADR_EMD_NM VARCHAR(200)  ,  -- 주소_읍면동_명칭 - 명칭_VAR200		
	ADR_SPP_RD_SRN VARCHAR(10)  ,  -- 주소_상위_도로_일련번호 - 일련번호_VAR10		
	ADR_SPP_RD_NM VARCHAR(200)  ,  -- 주소_상위_도로_명칭 - 명칭_VAR200		
	ADR_RDN_CD_USE_YN CHAR(1)  ,  -- 주소_도로명_코드_사용_여부 - 여부_CHR1		
	ADR_CHW_CCD VARCHAR(2)  ,  -- 주소_변경사유_구분코드 - 구분코드_VAR2		
	ADR_RDN_CHN_ACD VARCHAR(14)  ,  -- 주소_도로명_변경_주소코드 - 주소코드_VAR14		
	ADR_CAP_WRE_NM VARCHAR(200)  ,  -- 주소_시도_영문_명칭 - 명칭_VAR200		
	ADR_SGG_WRE_NM VARCHAR(200)  ,  -- 주소_시군구_영문_명칭 - 명칭_VAR200		
	ADR_EMD_WRE_NM VARCHAR(200)  ,  -- 주소_읍면동_영문_명칭 - 명칭_VAR200		
	ADR_NTF_OGD VARCHAR(8)  ,  -- 주소_고시_원본일자 - 원본일자_VAR8		
	ADR_ERS_OGD VARCHAR(8)  ,  -- 주소_말소_원본일자 - 원본일자_VAR8		

	CONSTRAINT TBL_RNA_BLD_RDN_CD_pkey PRIMARY KEY (ADR_SGG_ACD, ADR_RD_SRN, ADR_EMD_SRN)	
);


CREATE TABLE ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD ( -- 도로명주소_주소_도로명_코드 테이블		
	ADR_RD_ACD VARCHAR(14) NOT NULL ,  -- 주소_도로_주소코드 - 주소코드_VAR14	
	ADR_RD_NM VARCHAR(200)  ,  -- 주소_도로_명칭 - 명칭_VAR200		
	ADR_RD_WRE_NM VARCHAR(200)  ,  -- 주소_도로_영문_명칭 - 명칭_VAR200		
	ADR_EMD_SRN VARCHAR(10) NOT NULL ,  -- 주소_읍면동_일련번호 - 일련번호_VAR10	
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200		
	ADR_CAP_WRE_NM VARCHAR(200)  ,  -- 주소_시도_영문_명칭 - 명칭_VAR200		
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200		
	ADR_SGG_BLD_WRE_NM VARCHAR(200)  ,  -- 주소_시군구_건물_영문_명칭 - 명칭_VAR200		
	ADR_EMD_NM VARCHAR(200)  ,  -- 주소_읍면동_명칭 - 명칭_VAR200		
	ADR_EMD_WRE_NM VARCHAR(200)  ,  -- 주소_읍면동_영문_명칭 - 명칭_VAR200		
	ADR_EMD_CCD VARCHAR(2)  ,  -- 주소_읍면동_구분코드 - 구분코드_VAR2		
	ADR_EMD_ACD VARCHAR(14)  ,  -- 주소_읍면동_주소코드 - 주소코드_VAR14		
	ADR_RDN_CD_USE_YN CHAR(1)  ,  -- 주소_도로명_코드_사용_여부 - 여부_CHR1		
	ADR_RDN_CD_CHW_CCD VARCHAR(2)  ,  -- 주소_도로명_코드_변경사유_구분코드 - 구분코드_VAR2		
	ADR_RDN_CHN_ACD VARCHAR(14)  ,  -- 주소_도로명_변경_주소코드 - 주소코드_VAR14		
	ADR_NTF_OGD VARCHAR(8)  ,  -- 주소_고시_원본일자 - 원본일자_VAR8		
	ADR_ERS_OGD VARCHAR(8)  ,  -- 주소_말소_원본일자 - 원본일자_VAR8		

	CONSTRAINT TBL_RNA_ADR_RDN_CD_pkey PRIMARY KEY (ADR_RD_ACD, ADR_EMD_SRN)	
);


CREATE TABLE ROWDATA_ADDR.TBL_RNA_ADR ( -- 도로명주소_주소 테이블		
	ADR_MNN VARCHAR(25) NOT NULL ,  -- 주소_관리번호 - 관리번호_VAR25	
	ADR_RD_ACD VARCHAR(14)  ,  -- 주소_도로_주소코드 - 주소코드_VAR14			
	ADR_EMD_SRN VARCHAR(10)  ,  -- 주소_읍면동_일련번호 - 일련번호_VAR10		
	ADR_UND_CCD VARCHAR(2)  ,  -- 주소_지하_구분코드 - 구분코드_VAR2		
	ADR_BLD_ORN_NMB INTEGER  ,  -- 주소_건물_본번_번호 - 번호_INT		
	ADR_BLD_VCN_NMB INTEGER  ,  -- 주소_건물_부번_번호 - 번호_INT		
	ADR_SDS VARCHAR(5)  ,  -- 주소_국가기초구역번호 - 국가기초구역번호_VAR5		
	ADR_CHN_CCD VARCHAR(2)  ,  -- 주소_변경_구분코드 - 구분코드_VAR2		
	ADR_NTF_OGD VARCHAR(8)  ,  -- 주소_고시_원본일자 - 원본일자_VAR8		
	ADR_CHN_BFR_RNA_NM VARCHAR(200)  ,  -- 주소_변경_이전_도로명주소_명칭 - 명칭_VAR200		
	ADR_DTA_GRN_YN CHAR(1)  ,  -- 주소_상세주소_부여_여부 - 여부_CHR1		

	CONSTRAINT TBL_RNA_ADR_pkey PRIMARY KEY (ADR_MNN)	
	,CONSTRAINT TBL_RNA_ADR_fk1 FOREIGN KEY (ADR_RD_ACD, ADR_EMD_SRN) REFERENCES ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD (ADR_RD_ACD, ADR_EMD_SRN) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION -- 부모테이블.컬럼-자식테이블.컬럼 : 도로명주소_주소_도로명_코드(TBL_RNA_ADR_RDN_CD).주소_도로_주소코드(ADR_RD_ACD) - 도로명주소_주소(TBL_RNA_ADR).주소_도로_주소코드(ADR_RD_ACD)
);


CREATE TABLE ROWDATA_ADDR.TBL_RNA_ADR_LTN ( -- 도로명주소_주소_지번 테이블		
	ADR_MNN VARCHAR(25) NOT NULL ,  -- 주소_관리번호 - 관리번호_VAR25	
	ADR_SRN VARCHAR(10) NOT NULL ,  -- 주소_일련번호 - 일련번호_VAR10		
	ADR_LGD_ACD VARCHAR(14)  ,  -- 주소_법정동_주소코드 - 주소코드_VAR14		
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200		
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200		
	ADR_LGL_EMD_NM VARCHAR(200)  ,  -- 주소_법정_읍면동_명칭 - 명칭_VAR200		
	ADR_LGL_LI_NM VARCHAR(200)  ,  -- 주소_법정_리_명칭 - 명칭_VAR200		
	ADR_MNT_CCD VARCHAR(2)  ,  -- 주소_산_구분코드 - 구분코드_VAR2		
	ADR_LTN_ORN_NMB INTEGER  ,  -- 주소_지번_본번_번호 - 번호_INT		
	ADR_LTN_VCN_NMB INTEGER  ,  -- 주소_지번_부번_번호 - 번호_INT		
	ADR_LTN_CCD VARCHAR(2)  ,  -- 주소_지번_구분코드 - 구분코드_VAR2		
	ADR_CHN_CCD VARCHAR(2)  ,  -- 주소_변경_구분코드 - 구분코드_VAR2		

	CONSTRAINT TBL_RNA_ADR_LTN_pkey PRIMARY KEY (ADR_MNN, ADR_SRN)	
	,CONSTRAINT TBL_RNA_ADR_LTN_fk1 FOREIGN KEY (ADR_MNN) REFERENCES ROWDATA_ADDR.TBL_RNA_ADR (ADR_MNN) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION -- 부모테이블.컬럼-자식테이블.컬럼 : 도로명주소_주소(TBL_RNA_ADR).주소_관리번호(ADR_MNN) - 도로명주소_주소_지번(TBL_RNA_ADR_LTN).주소_관리번호(ADR_MNN)
);


CREATE TABLE ROWDATA_ADDR.TBL_RNA_ADR_ADT ( -- 도로명주소_주소_부가 테이블		
	ADR_MNN VARCHAR(25) NOT NULL ,  -- 주소_관리번호 - 관리번호_VAR25	
	ADR_ADD_ACD VARCHAR(14)  ,  -- 주소_행정동_주소코드 - 주소코드_VAR14		
	ADR_ADD_NM VARCHAR(200)  ,  -- 주소_행정동_명칭 - 명칭_VAR200		
	ADR_ZPC VARCHAR(6)  ,  -- 주소_우편번호 - 우편번호_VAR6		
	ADR_ZPC_SRN VARCHAR(10)  ,  -- 주소_우편번호_일련번호 - 일련번호_VAR10		
	ADR_QNT_DLV_LCT_NM VARCHAR(200)  ,  -- 주소_다량_배달_위치_명칭 - 명칭_VAR200		
	ADR_BDL_BLD_NM VARCHAR(200)  ,  -- 주소_건축물대장_건물_명칭 - 명칭_VAR200		
	ADR_SGG_BLD_NM VARCHAR(200)  ,  -- 주소_시군구_건물_명칭 - 명칭_VAR200		
	ADR_APT_CCD VARCHAR(2)  ,  -- 주소_공동주택_구분코드 - 구분코드_VAR2		
	ADR_CHN_CCD VARCHAR(2)  ,  -- 주소_변경_구분코드 - 구분코드_VAR2		

	CONSTRAINT TBL_RNA_ADR_ADT_pkey PRIMARY KEY (ADR_MNN)	
	,CONSTRAINT TBL_RNA_ADR_ADT_fk1 FOREIGN KEY (ADR_MNN) REFERENCES ROWDATA_ADDR.TBL_RNA_ADR (ADR_MNN) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION -- 부모테이블.컬럼-자식테이블.컬럼 : 도로명주소_주소(TBL_RNA_ADR).주소_관리번호(ADR_MNN) - 도로명주소_주소_부가(TBL_RNA_ADR_ADT).주소_관리번호(ADR_MNN)
);


CREATE TABLE ROWDATA_ADDR.TBL_RNA_NVG_BLD ( -- 도로명주소_내비게이션_건물 테이블		
	ADR_JRS_EMD_ACD VARCHAR(14)  ,  -- 주소_관할_읍면동_주소코드 - 주소코드_VAR14		
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200		
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200		
	ADR_EMD_NM VARCHAR(200)  ,  -- 주소_읍면동_명칭 - 명칭_VAR200		
	ADR_RD_ACD VARCHAR(14)  ,  -- 주소_도로_주소코드 - 주소코드_VAR14		
	ADR_RD_NM VARCHAR(200)  ,  -- 주소_도로_명칭 - 명칭_VAR200		
	ADR_UND_CCD VARCHAR(2)  ,  -- 주소_지하_구분코드 - 구분코드_VAR2		
	ADR_BLD_ORN_NMB INTEGER  ,  -- 주소_건물_본번_번호 - 번호_INT		
	ADR_BLD_VCN_NMB INTEGER  ,  -- 주소_건물_부번_번호 - 번호_INT		
	ADR_ZPC VARCHAR(6)  ,  -- 주소_우편번호 - 우편번호_VAR6		
	ADR_BLD_MNN VARCHAR(25) NOT NULL ,  -- 주소_건물_관리번호 - 관리번호_VAR25	
	ADR_SGG_BLD_NM VARCHAR(200)  ,  -- 주소_시군구_건물_명칭 - 명칭_VAR200		
	ADR_STR_PRP_CNT VARCHAR(1000)  ,  -- 주소_건축물_용도_내용 - 내용_VAR1000		
	ADR_ADD_ACD VARCHAR(14)  ,  -- 주소_행정동_주소코드 - 주소코드_VAR14		
	ADR_ADD_NM VARCHAR(200)  ,  -- 주소_행정동_명칭 - 명칭_VAR200		
	ADR_GRD_FLR_NMR INTEGER  ,  -- 주소_지상_층_개수 - 개수_INT		
	ADR_UND_FLR_NMR INTEGER  ,  -- 주소_지하_층_개수 - 개수_INT		
	ADR_APT_CCD VARCHAR(2)  ,  -- 주소_공동주택_구분코드 - 구분코드_VAR2		
	ADR_SMN_ADR_BLD_NMR INTEGER  ,  -- 주소_동일_주소_건물_개수 - 개수_INT		
	ADR_DTL_BLD_NM VARCHAR(200)  ,  -- 주소_상세_건물_명칭 - 명칭_VAR200		
	ADR_BLD_NM_CHB_CNT VARCHAR(1000)  ,  -- 주소_건물_명칭_변경내역_내용 - 내용_VAR1000		
	ADR_DTA_CHB_CNT VARCHAR(1000)  ,  -- 주소_상세주소_변경내역_내용 - 내용_VAR1000		
	ADR_RSD_CCD VARCHAR(2)  ,  -- 주소_거주_구분코드 - 구분코드_VAR2		
	ADR_BLD_LTT NUMERIC(15,6)  ,  -- 주소_건물_위도 - 위도_NMR15-6		
	ADR_BLD_LNG NUMERIC(15,6)  ,  -- 주소_건물_경도 - 경도_NMR15-6		
	ADR_ENT_LTT NUMERIC(15,6)  ,  -- 주소_출입구_위도 - 위도_NMR15-6		
	ADR_ENT_LNG NUMERIC(15,6)  ,  -- 주소_출입구_경도 - 경도_NMR15-6		
	ADR_CAP_WRE_NM VARCHAR(200)  ,  -- 주소_시도_영문_명칭 - 명칭_VAR200		
	ADR_SGG_WRE_NM VARCHAR(200)  ,  -- 주소_시군구_영문_명칭 - 명칭_VAR200		
	ADR_EMD_WRE_NM VARCHAR(200)  ,  -- 주소_읍면동_영문_명칭 - 명칭_VAR200		
	ADR_RD_WRE_NM VARCHAR(200)  ,  -- 주소_도로_영문_명칭 - 명칭_VAR200		
	ADR_EMD_CCD VARCHAR(2)  ,  -- 주소_읍면동_구분코드 - 구분코드_VAR2		
	ADR_MPO_CCD VARCHAR(2)  ,  -- 주소_이동사유_구분코드 - 구분코드_VAR2		

	CONSTRAINT TBL_RNA_NVG_BLD_pkey PRIMARY KEY (ADR_BLD_MNN)	
);


CREATE TABLE ROWDATA_ADDR.TBL_RNA_NVG_LTN ( -- 도로명주소_내비게이션_지번 테이블		
	ADR_LGD_ACD VARCHAR(14)  ,  -- 주소_법정동_주소코드 - 주소코드_VAR14		
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200		
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200		
	ADR_EMD_NM VARCHAR(200)  ,  -- 주소_읍면동_명칭 - 명칭_VAR200		
	ADR_LI_NM VARCHAR(200)  ,  -- 주소_리_명칭 - 명칭_VAR200		
	ADR_MNT_CCD VARCHAR(2)  ,  -- 주소_산_구분코드 - 구분코드_VAR2		
	ADR_LTN_ORN_NMB INTEGER  ,  -- 주소_지번_본번_번호 - 번호_INT		
	ADR_LTN_VCN_NMB INTEGER  ,  -- 주소_지번_부번_번호 - 번호_INT		
	ADR_RD_ACD VARCHAR(14) NOT NULL ,  -- 주소_도로_주소코드 - 주소코드_VAR14	
	ADR_UND_CCD VARCHAR(2) NOT NULL ,  -- 주소_지하_구분코드 - 구분코드_VAR2		
	ADR_BLD_ORN_NMB INTEGER NOT NULL ,  -- 주소_건물_본번_번호 - 번호_INT		
	ADR_BLD_VCN_NMB INTEGER NOT NULL ,  -- 주소_건물_부번_번호 - 번호_INT		
	ADR_LTN_SRN VARCHAR(10) NOT NULL ,  -- 주소_지번_일련번호 - 일련번호_VAR10		
	ADR_CAP_WRE_NM VARCHAR(200)  ,  -- 주소_시도_영문_명칭 - 명칭_VAR200		
	ADR_SGG_WRE_NM VARCHAR(200)  ,  -- 주소_시군구_영문_명칭 - 명칭_VAR200		
	ADR_EMD_WRE_NM VARCHAR(200)  ,  -- 주소_읍면동_영문_명칭 - 명칭_VAR200		
	ADR_LI_WRE_NM VARCHAR(200)  ,  -- 주소_리_영문_명칭 - 명칭_VAR200		
	ADR_MPO_CCD VARCHAR(2)  ,  -- 주소_이동사유_구분코드 - 구분코드_VAR2		
	ADR_BLD_MNN VARCHAR(25)  ,  -- 주소_건물_관리번호 - 관리번호_VAR25		
	ADR_JRS_EMD_ACD VARCHAR(14) NOT NULL ,  -- 주소_관할_읍면동_주소코드 - 주소코드_VAR14

	CONSTRAINT TBL_RNA_NVG_LTN_pkey PRIMARY KEY (ADR_RD_ACD, ADR_UND_CCD, ADR_BLD_ORN_NMB, ADR_BLD_VCN_NMB, ADR_LTN_SRN, ADR_JRS_EMD_ACD)	
);


CREATE TABLE ROWDATA_ADDR.TBL_RNA_NVG_ASS_ENT ( -- 도로명주소_내비게이션_보조_출입구 테이블		
	ADR_SGG_ACD VARCHAR(14) NOT NULL ,  -- 주소_시군구_주소코드 - 주소코드_VAR14	
	ADR_ENT_SRN VARCHAR(10) NOT NULL ,  -- 주소_출입구_일련번호 - 일련번호_VAR10		
	ADR_RD_ACD VARCHAR(14)  ,  -- 주소_도로_주소코드 - 주소코드_VAR14		
	ADR_UND_CCD VARCHAR(2)  ,  -- 주소_지하_구분코드 - 구분코드_VAR2		
	ADR_BLD_ORN_NMB INTEGER  ,  -- 주소_건물_본번_번호 - 번호_INT		
	ADR_BLD_VCN_NMB INTEGER  ,  -- 주소_건물_부번_번호 - 번호_INT		
	ADR_LGD_ACD VARCHAR(14)  ,  -- 주소_법정동_주소코드 - 주소코드_VAR14		
	ADR_ENT_CCD VARCHAR(2)  ,  -- 주소_출입구_구분코드 - 구분코드_VAR2		
	ADR_ENT_LTT NUMERIC(15,6)  ,  -- 주소_출입구_위도 - 위도_NMR15-6		
	ADR_ENT_LNG NUMERIC(15,6)  ,  -- 주소_출입구_경도 - 경도_NMR15-6		
	ADR_MPO_CCD VARCHAR(2)  ,  -- 주소_이동사유_구분코드 - 구분코드_VAR2		

	CONSTRAINT TBL_RNA_NVG_ASS_ENT_pkey PRIMARY KEY (ADR_SGG_ACD, ADR_ENT_SRN)	
);


CREATE TABLE ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD ( -- 도로명주소_사서함_도로명_코드 테이블		
	ADR_SGG_ACD VARCHAR(14) NOT NULL ,  -- 주소_시군구_주소코드 - 주소코드_VAR14	
	ADR_RD_SRN VARCHAR(10) NOT NULL ,  -- 주소_도로_일련번호 - 일련번호_VAR10		
	ADR_RD_NM VARCHAR(200)  ,  -- 주소_도로_명칭 - 명칭_VAR200		
	ADR_RD_WRE_NM VARCHAR(200)  ,  -- 주소_도로_영문_명칭 - 명칭_VAR200		
	ADR_EMD_SRN VARCHAR(10) NOT NULL ,  -- 주소_읍면동_일련번호 - 일련번호_VAR10	
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200		
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200		
	ADR_EMD_CCD VARCHAR(2)  ,  -- 주소_읍면동_구분코드 - 구분코드_VAR2		
	ADR_EMD_ACD VARCHAR(14)  ,  -- 주소_읍면동_주소코드 - 주소코드_VAR14		
	ADR_EMD_NM VARCHAR(200)  ,  -- 주소_읍면동_명칭 - 명칭_VAR200		
	ADR_SPP_RD_SRN VARCHAR(10)  ,  -- 주소_상위_도로_일련번호 - 일련번호_VAR10		
	ADR_SPP_RD_NM VARCHAR(200)  ,  -- 주소_상위_도로_명칭 - 명칭_VAR200		
	ADR_RDN_CD_USE_YN CHAR(1)  ,  -- 주소_도로명_코드_사용_여부 - 여부_CHR1		
	ADR_RDN_CD_CHW_CCD VARCHAR(2)  ,  -- 주소_도로명_코드_변경사유_구분코드 - 구분코드_VAR2		
	ADR_RDN_CHN_ACD VARCHAR(14)  ,  -- 주소_도로명_변경_주소코드 - 주소코드_VAR14		
	ADR_CAP_WRE_NM VARCHAR(200)  ,  -- 주소_시도_영문_명칭 - 명칭_VAR200		
	ADR_SGG_WRE_NM VARCHAR(200)  ,  -- 주소_시군구_영문_명칭 - 명칭_VAR200		
	ADR_EMD_WRE_NM VARCHAR(200)  ,  -- 주소_읍면동_영문_명칭 - 명칭_VAR200		
	ADR_NTF_OGD VARCHAR(8)  ,  -- 주소_고시_원본일자 - 원본일자_VAR8		
	ADR_ERS_OGD VARCHAR(8)  ,  -- 주소_말소_원본일자 - 원본일자_VAR8		

	CONSTRAINT TBL_RNA_MLB_RDN_CD_pkey PRIMARY KEY (ADR_SGG_ACD, ADR_RD_SRN, ADR_EMD_SRN)	
);


CREATE TABLE ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR ( -- 도로명주소_사서함_도로명_주소 테이블		
	ADR_LGD_ACD VARCHAR(14)  ,  -- 주소_법정동_주소코드 - 주소코드_VAR14		
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200		
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200		
	ADR_LGL_EMD_NM VARCHAR(200)  ,  -- 주소_법정_읍면동_명칭 - 명칭_VAR200		
	ADR_LGL_LI_NM VARCHAR(200)  ,  -- 주소_법정_리_명칭 - 명칭_VAR200		
	ADR_MNT_CCD VARCHAR(2)  ,  -- 주소_산_구분코드 - 구분코드_VAR2		
	ADR_LTN_ORN_NMB INTEGER  ,  -- 주소_지번_본번_번호 - 번호_INT		
	ADR_LTN_VCN_NMB INTEGER  ,  -- 주소_지번_부번_번호 - 번호_INT		
	ADR_RD_ACD VARCHAR(14)  ,  -- 주소_도로_주소코드 - 주소코드_VAR14		
	ADR_RD_NM VARCHAR(200)  ,  -- 주소_도로_명칭 - 명칭_VAR200		
	ADR_UND_CCD VARCHAR(2)  ,  -- 주소_지하_구분코드 - 구분코드_VAR2		
	ADR_BLD_ORN_NMB INTEGER  ,  -- 주소_건물_본번_번호 - 번호_INT		
	ADR_BLD_VCN_NMB INTEGER  ,  -- 주소_건물_부번_번호 - 번호_INT		
	ADR_BDL_BLD_NM VARCHAR(200)  ,  -- 주소_건축물대장_건물_명칭 - 명칭_VAR200		
	ADR_DTL_BLD_NM VARCHAR(200)  ,  -- 주소_상세_건물_명칭 - 명칭_VAR200		
	ADR_BLD_MNN VARCHAR(25) NOT NULL ,  -- 주소_건물_관리번호 - 관리번호_VAR25	
	ADR_EMD_SRN VARCHAR(10)  ,  -- 주소_읍면동_일련번호 - 일련번호_VAR10		
	ADR_ADD_ACD VARCHAR(14)  ,  -- 주소_행정동_주소코드 - 주소코드_VAR14		
	ADR_ADD_NM VARCHAR(200)  ,  -- 주소_행정동_명칭 - 명칭_VAR200		
	ADR_ZPC VARCHAR(6)  ,  -- 주소_우편번호 - 우편번호_VAR6		
	ADR_PST_SRN VARCHAR(10)  ,  -- 주소_우편_일련번호 - 일련번호_VAR10		
	ADR_QNT_DLV_LCT_NM VARCHAR(200)  ,  -- 주소_다량_배달_위치_명칭 - 명칭_VAR200		
	ADR_MPO_CCD VARCHAR(2)  ,  -- 주소_이동사유_구분코드 - 구분코드_VAR2		
	ADR_NTF_OGD VARCHAR(8)  ,  -- 주소_고시_원본일자 - 원본일자_VAR8		
	ADR_CHN_BFR_RNA_NM VARCHAR(200)  ,  -- 주소_변경_이전_도로명주소_명칭 - 명칭_VAR200		
	ADR_SGG_BLD_NM VARCHAR(200)  ,  -- 주소_시군구_건물_명칭 - 명칭_VAR200		
	ADR_APT_CCD VARCHAR(2)  ,  -- 주소_공동주택_구분코드 - 구분코드_VAR2		
	ADR_SDS VARCHAR(5)  ,  -- 주소_국가기초구역번호 - 국가기초구역번호_VAR5		
	ADR_DTA_GRN_YN CHAR(1)  ,  -- 주소_상세주소_부여_여부 - 여부_CHR1		
	ADR_RM1_CNT VARCHAR(1000)  ,  -- 주소_비고1_내용 - 내용_VAR1000		
	ADR_RM2_CNT VARCHAR(1000)  ,  -- 주소_비고2_내용 - 내용_VAR1000		

	CONSTRAINT TBL_RNA_MLB_RDN_ADR_pkey PRIMARY KEY (ADR_BLD_MNN)	
);


CREATE TABLE ROWDATA_ADDR.TBL_RNA_DTL_ADR ( -- 도로명주소_상세_주소 테이블		
	ADR_SGG_ACD VARCHAR(14) NOT NULL ,  -- 주소_시군구_주소코드 - 주소코드_VAR14	
	ADR_DNG_SRN VARCHAR(10) NOT NULL ,  -- 주소_동_일련번호 - 일련번호_VAR10		
	ADR_FLR_SRN VARCHAR(10) NOT NULL ,  -- 주소_층_일련번호 - 일련번호_VAR10		
	ADR_HO_SRN VARCHAR(10) NOT NULL ,  -- 주소_호_일련번호 - 일련번호_VAR10		
	ADR_HO_SFX_SRN VARCHAR(10) NOT NULL ,  -- 주소_호_접미사_일련번호 - 일련번호_VAR10		
	ADR_DNG_NM VARCHAR(200)  ,  -- 주소_동_명칭 - 명칭_VAR200		
	ADR_FLR_NM VARCHAR(200)  ,  -- 주소_층_명칭 - 명칭_VAR200		
	ADR_HO_NM VARCHAR(200)  ,  -- 주소_호_명칭 - 명칭_VAR200		
	ADR_HO_SFX_NM VARCHAR(200)  ,  -- 주소_호_접미사_명칭 - 명칭_VAR200		
	ADR_UND_YN CHAR(1)  ,  -- 주소_지하_여부 - 여부_CHR1		
	ADR_BLD_MNN VARCHAR(25)  ,  -- 주소_건물_관리번호 - 관리번호_VAR25		
	ADR_LGD_ACD VARCHAR(14)  ,  -- 주소_법정동_주소코드 - 주소코드_VAR14		
	ADR_RD_ACD VARCHAR(14)  ,  -- 주소_도로_주소코드 - 주소코드_VAR14		
	ADR_UND_CCD VARCHAR(2)  ,  -- 주소_지하_구분코드 - 구분코드_VAR2		
	ADR_BLD_ORN_NMB INTEGER  ,  -- 주소_건물_본번_번호 - 번호_INT		
	ADR_BLD_VCN_NMB INTEGER  ,  -- 주소_건물_부번_번호 - 번호_INT		
	ADR_MPO_CCD VARCHAR(2)  ,  -- 주소_이동사유_구분코드 - 구분코드_VAR2		

	CONSTRAINT TBL_RNA_DTL_ADR_pkey PRIMARY KEY (ADR_SGG_ACD, ADR_DNG_SRN, ADR_FLR_SRN, ADR_HO_SRN, ADR_HO_SFX_SRN)	
);


CREATE TABLE ROWDATA_ADDR.TBL_RNA_LCT_SMR ( -- 도로명주소_위치_요약 테이블		
	ADR_SGG_ACD VARCHAR(14)  ,  -- 주소_시군구_주소코드 - 주소코드_VAR14		
	ADR_ENT_SRN VARCHAR(10)  ,  -- 주소_출입구_일련번호 - 일련번호_VAR10		
	ADR_LGD_ACD VARCHAR(14) NOT NULL ,  -- 주소_법정동_주소코드 - 주소코드_VAR14	
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200		
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200		
	ADR_EMD_NM VARCHAR(200)  ,  -- 주소_읍면동_명칭 - 명칭_VAR200		
	ADR_RD_ACD VARCHAR(14) NOT NULL ,  -- 주소_도로_주소코드 - 주소코드_VAR14	
	ADR_RD_NM VARCHAR(200)  ,  -- 주소_도로_명칭 - 명칭_VAR200		
	ADR_UND_CCD VARCHAR(2) NOT NULL ,  -- 주소_지하_구분코드 - 구분코드_VAR2	
	ADR_BLD_ORN_NMB INTEGER NOT NULL ,  -- 주소_건물_본번_번호 - 번호_INT		
	ADR_BLD_VCN_NMB INTEGER NOT NULL ,  -- 주소_건물_부번_번호 - 번호_INT		
	ADR_BLD_NM VARCHAR(200)  ,  -- 주소_건물_명칭 - 명칭_VAR200		
	ADR_ZPC VARCHAR(6)  ,  -- 주소_우편번호 - 우편번호_VAR6		
	ADR_STR_PRP_CNT VARCHAR(1000)  ,  -- 주소_건축물_용도_내용 - 내용_VAR1000		
	ADR_SNB_CCD VARCHAR(2)  ,  -- 주소_단독건물_구분코드 - 구분코드_VAR2		
	ADR_JRS_ADD_NM VARCHAR(200)  ,  -- 주소_관할_행정동_명칭 - 명칭_VAR200		
	ADR_LTT NUMERIC(15,6)  ,  -- 주소_위도 - 위도_NMR15-6		
	ADR_LNG NUMERIC(15,6)  ,  -- 주소_경도 - 경도_NMR15-6		
	ADR_MPO_CCD VARCHAR(2)  ,  -- 주소_이동사유_구분코드 - 구분코드_VAR2		

	CONSTRAINT TBL_RNA_LCT_SMR_pkey PRIMARY KEY (ADR_RD_ACD, ADR_UND_CCD, ADR_BLD_ORN_NMB, ADR_BLD_VCN_NMB, ADR_LGD_ACD)	
);


CREATE TABLE ROWDATA_ADDR.TBL_LGD_CD ( -- 법정동_코드 테이블		
	ADR_LGD_ACD VARCHAR(14) NOT NULL ,  -- 주소_법정동_주소코드 - 주소코드_VAR14	
	ADR_LGD_NM VARCHAR(200)  ,  -- 주소_법정동_명칭 - 명칭_VAR200		
	ADR_ABL_CCD VARCHAR(2)  ,  -- 주소_폐지_구분코드 - 구분코드_VAR2		
	ADR_SPP_ARE_ACD VARCHAR(14)  ,  -- 주소_상위_지역_주소코드 - 주소코드_VAR14		
	ADR_LGD_CD_ORD VARCHAR(2)  ,  -- 주소_법정동_코드_서열 - 서열_VAR2		
	ADR_LGD_CD_CRT_OGD VARCHAR(8)  ,  -- 주소_법정동_코드_생성_원본일자 - 원본일자_VAR8		
	ADR_ABL_OGD VARCHAR(8)  ,  -- 주소_폐지_원본일자 - 원본일자_VAR8		
	ADR_LST_OPR_OGD VARCHAR(8)  ,  -- 주소_최종_작업_원본일자 - 원본일자_VAR8		
	ADR_LWS_ARE_NM VARCHAR(200)  ,  -- 주소_최하_지역_명칭 - 명칭_VAR200		
	ADR_LGD_INH_ACD VARCHAR(14)  ,  -- 주소_법정동_주민_주소코드 - 주소코드_VAR14		
	ADR_LGD_LNR_ACD VARCHAR(14)  ,  -- 주소_법정동_지적_주소코드 - 주소코드_VAR14		

	CONSTRAINT TBL_LGD_CD_pkey PRIMARY KEY (ADR_LGD_ACD)	
);












/*

CREATE TABLE ROWDATA_ADDR.TBL_RNA_BLD( -- 도로명주소_건물 테이블
	ADR_BLD_MNN VARCHAR(25) NOT NULL ,  -- 주소_건물_관리번호 - 관리번호_VAR25
	ADR_LGD_ACD VARCHAR(14)  ,  -- 주소_법정동_주소코드 - 주소코드_VAR14
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200
	ADR_LGL_EMD_NM VARCHAR(200)  ,  -- 주소_법정_읍면동_명칭 - 명칭_VAR200
	ADR_LGL_LI_NM VARCHAR(200)  ,  -- 주소_법정_리_명칭 - 명칭_VAR200
	ADR_MNT_CCD VARCHAR(2)  ,  -- 주소_산_구분코드 - 구분코드_VAR2
	ADR_LTN_ORN_NMB INTEGER  ,  -- 주소_지번_본번_번호 - 번호_INT
	ADR_LTN_VCN_NMB INTEGER  ,  -- 주소_지번_부번_번호 - 번호_INT
	ADR_RD_ACD VARCHAR(14)  ,  -- 주소_도로_주소코드 - 주소코드_VAR14
	ADR_RD_NM VARCHAR(200)  ,  -- 주소_도로_명칭 - 명칭_VAR200
	ADR_UND_CCD VARCHAR(2)  ,  -- 주소_지하_구분코드 - 구분코드_VAR2
	ADR_BLD_ORN_NMB INTEGER  ,  -- 주소_건물_본번_번호 - 번호_INT
	ADR_BLD_VCN_NMB INTEGER  ,  -- 주소_건물_부번_번호 - 번호_INT
	ADR_BDL_BLD_NM VARCHAR(200)  ,  -- 주소_건축물대장_건물_명칭 - 명칭_VAR200
	ADR_DTL_BLD_NM VARCHAR(200)  ,  -- 주소_상세_건물_명칭 - 명칭_VAR200
	ADR_EMD_SRN VARCHAR(10)  ,  -- 주소_읍면동_일련번호 - 일련번호_VAR10
	ADR_ADD_ACD VARCHAR(14)  ,  -- 주소_행정동_주소코드 - 주소코드_VAR14
	ADR_ADD_NM VARCHAR(200)  ,  -- 주소_행정동_명칭 - 명칭_VAR200
	ADR_ZPC VARCHAR(6)  ,  -- 주소_우편번호 - 우편번호_VAR6
	ADR_PST_SRN VARCHAR(10)  ,  -- 주소_우편_일련번호 - 일련번호_VAR10
	ADR_QNT_DLV_LCT_NM VARCHAR(200)  ,  -- 주소_다량_배달_위치_명칭 - 명칭_VAR200
	ADR_MPO_CCD VARCHAR(2)  ,  -- 주소_이동사유_구분코드 - 구분코드_VAR2
	ADR_NTF_OGD VARCHAR(8)  ,  -- 주소_고시_원본일자 - 원본일자_VAR8
	ADR_CHN_BFR_RNA_NM VARCHAR(200)  ,  -- 주소_변경_이전_도로명주소_명칭 - 명칭_VAR200
	ADR_SGG_BLD_NM VARCHAR(200)  ,  -- 주소_시군구_건물_명칭 - 명칭_VAR200
	ADR_APT_CCD VARCHAR(2)  ,  -- 주소_공동주택_구분코드 - 구분코드_VAR2
	ADR_SDS VARCHAR(5)  ,  -- 주소_국가기초구역번호 - 국가기초구역번호_VAR5
	ADR_DTA_GRN_YN CHAR(1)  ,  -- 주소_상세주소_부여_여부 - 여부_CHR1
	ADR_RM1_CNT VARCHAR(1000)  ,  -- 주소_비고1_내용 - 내용_VAR1000
	ADR_RM2_CNT VARCHAR(1000)  ,  -- 주소_비고2_내용 - 내용_VAR1000

	CONSTRAINT TBL_RNA_BLD_pkey PRIMARY KEY (ADR_BLD_MNN)
);



CREATE TABLE ROWDATA_ADDR.TBL_RNA_BLD_RLT_LTN( -- 도로명주소_건물_관련_지번 테이블
	ADR_RD_ACD VARCHAR(14) NOT NULL ,  -- 주소_도로_주소코드 - 주소코드_VAR14
	ADR_UND_CCD VARCHAR(2) NOT NULL ,  -- 주소_지하_구분코드 - 구분코드_VAR2
	ADR_BLD_ORN_NMB INTEGER NOT NULL ,  -- 주소_건물_본번_번호 - 번호_INT
	ADR_BLD_VCN_NMB INTEGER NOT NULL ,  -- 주소_건물_부번_번호 - 번호_INT
	ADR_LTN_SRN VARCHAR(10) NOT NULL ,  -- 주소_지번_일련번호 - 일련번호_VAR10
	ADR_LGD_ACD VARCHAR(14)  ,  -- 주소_법정동_주소코드 - 주소코드_VAR14
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200
	ADR_LGL_EMD_NM VARCHAR(200)  ,  -- 주소_법정_읍면동_명칭 - 명칭_VAR200
	ADR_LGL_LI_NM VARCHAR(200)  ,  -- 주소_법정_리_명칭 - 명칭_VAR200
	ADR_MNT_CCD VARCHAR(2)  ,  -- 주소_산_구분코드 - 구분코드_VAR2
	ADR_LTN_ORN_NMB INTEGER  ,  -- 주소_지번_본번_번호 - 번호_INT
	ADR_LTN_VCN_NMB INTEGER  ,  -- 주소_지번_부번_번호 - 번호_INT
	ADR_MPO_CCD VARCHAR(2)  ,  -- 주소_이동사유_구분코드 - 구분코드_VAR2

	CONSTRAINT TBL_RNA_BLD_RLT_LTN_pkey PRIMARY KEY (ADR_RD_ACD, ADR_UND_CCD, ADR_BLD_ORN_NMB, ADR_BLD_VCN_NMB, ADR_LTN_SRN)
);



CREATE TABLE ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD( -- 도로명주소_건물_도로명_코드 테이블
	ADR_SGG_ACD VARCHAR(14) NOT NULL ,  -- 주소_시군구_주소코드 - 주소코드_VAR14
	ADR_RD_SRN VARCHAR(10)  ,  -- 주소_도로_일련번호 - 일련번호_VAR10
	ADR_EMD_SRN VARCHAR(10) NOT NULL ,  -- 주소_읍면동_일련번호 - 일련번호_VAR10
	ADR_RD_NM VARCHAR(200)  ,  -- 주소_도로_명칭 - 명칭_VAR200
	ADR_RD_WRE_NM VARCHAR(200)  ,  -- 주소_도로_영문_명칭 - 명칭_VAR200
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200
	ADR_EMD_CCD VARCHAR(2)  ,  -- 주소_읍면동_구분코드 - 구분코드_VAR2
	ADR_EMD_ACD VARCHAR(14)  ,  -- 주소_읍면동_주소코드 - 주소코드_VAR14
	ADR_EMD_NM VARCHAR(200)  ,  -- 주소_읍면동_명칭 - 명칭_VAR200
	ADR_SPP_RD_SRN VARCHAR(10)  ,  -- 주소_상위_도로_일련번호 - 일련번호_VAR10
	ADR_SPP_RD_NM VARCHAR(200)  ,  -- 주소_상위_도로_명칭 - 명칭_VAR200
	ADR_RDN_CD_USE_YN CHAR(1)  ,  -- 주소_도로명_코드_사용_여부 - 여부_CHR1
	ADR_CHW_CCD VARCHAR(2)  ,  -- 주소_변경사유_구분코드 - 구분코드_VAR2
	ADR_RDN_CHN_ACD VARCHAR(14)  ,  -- 주소_도로명_변경_주소코드 - 주소코드_VAR14
	ADR_CAP_WRE_NM VARCHAR(200)  ,  -- 주소_시도_영문_명칭 - 명칭_VAR200
	ADR_SGG_WRE_NM VARCHAR(200)  ,  -- 주소_시군구_영문_명칭 - 명칭_VAR200
	ADR_EMD_WRE_NM VARCHAR(200)  ,  -- 주소_읍면동_영문_명칭 - 명칭_VAR200
	ADR_NTF_OGD VARCHAR(8)  ,  -- 주소_고시_원본일자 - 원본일자_VAR8
	ADR_ERS_OGD VARCHAR(8)  ,  -- 주소_말소_원본일자 - 원본일자_VAR8

	CONSTRAINT TBL_RNA_BLD_RDN_CD_pkey PRIMARY KEY (ADR_SGG_ACD, ADR_RD_SRN, ADR_EMD_SRN)
);



CREATE TABLE ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD( -- 도로명주소_주소_도로명_코드 테이블
	ADR_RD_ACD VARCHAR(14) NOT NULL ,  -- 주소_도로_주소코드 - 주소코드_VAR14
	ADR_EMD_SRN VARCHAR(10) NOT NULL ,  -- 주소_읍면동_일련번호 - 일련번호_VAR10
	ADR_RD_NM VARCHAR(200)  ,  -- 주소_도로_명칭 - 명칭_VAR200
	ADR_RD_WRE_NM VARCHAR(200)  ,  -- 주소_도로_영문_명칭 - 명칭_VAR200
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200
	ADR_CAP_WRE_NM VARCHAR(200)  ,  -- 주소_시도_영문_명칭 - 명칭_VAR200
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200
	ADR_SGG_BLD_WRE_NM VARCHAR(200)  ,  -- 주소_시군구_건물_영문_명칭 - 명칭_VAR200
	ADR_EMD_NM VARCHAR(200)  ,  -- 주소_읍면동_명칭 - 명칭_VAR200
	ADR_EMD_WRE_NM VARCHAR(200)  ,  -- 주소_읍면동_영문_명칭 - 명칭_VAR200
	ADR_EMD_CCD VARCHAR(2)  ,  -- 주소_읍면동_구분코드 - 구분코드_VAR2
	ADR_EMD_ACD VARCHAR(14)  ,  -- 주소_읍면동_주소코드 - 주소코드_VAR14
	ADR_RDN_CD_USE_YN CHAR(1)  ,  -- 주소_도로명_코드_사용_여부 - 여부_CHR1
	ADR_RDN_CD_CHW_CCD VARCHAR(2)  ,  -- 주소_도로명_코드_변경사유_구분코드 - 구분코드_VAR2
	ADR_RDN_CHN_ACD VARCHAR(14)  ,  -- 주소_도로명_변경_주소코드 - 주소코드_VAR14
	ADR_NTF_OGD VARCHAR(8)  ,  -- 주소_고시_원본일자 - 원본일자_VAR8
	ADR_ERS_OGD VARCHAR(8)  ,  -- 주소_말소_원본일자 - 원본일자_VAR8

	CONSTRAINT TBL_RNA_ADR_RDN_CD_pkey PRIMARY KEY (ADR_RD_ACD, ADR_EMD_SRN)
);


CREATE TABLE ROWDATA_ADDR.TBL_RNA_ADR( -- 도로명주소_주소 테이블
	ADR_MNN VARCHAR(25) NOT NULL ,  -- 주소_관리번호 - 관리번호_VAR25
	ADR_RD_ACD VARCHAR(14)  ,  -- 주소_도로_주소코드 - 주소코드_VAR14
	ADR_EMD_SRN VARCHAR(10)  ,  -- 주소_읍면동_일련번호 - 일련번호_VAR10
	ADR_UND_CCD VARCHAR(2)  ,  -- 주소_지하_구분코드 - 구분코드_VAR2
	ADR_BLD_ORN_NMB INTEGER  ,  -- 주소_건물_본번_번호 - 번호_INT
	ADR_BLD_VCN_NMB INTEGER  ,  -- 주소_건물_부번_번호 - 번호_INT
	ADR_SDS VARCHAR(5)  ,  -- 주소_국가기초구역번호 - 국가기초구역번호_VAR5
	ADR_CHN_CCD VARCHAR(2)  ,  -- 주소_변경_구분코드 - 구분코드_VAR2
	ADR_NTF_OGD VARCHAR(8)  ,  -- 주소_고시_원본일자 - 원본일자_VAR8
	ADR_CHN_BFR_RNA_NM VARCHAR(200)  ,  -- 주소_변경_이전_도로명주소_명칭 - 명칭_VAR200
	ADR_DTA_GRN_YN CHAR(1)  ,  -- 주소_상세주소_부여_여부 - 여부_CHR1

	CONSTRAINT TBL_RNA_ADR_pkey PRIMARY KEY (ADR_MNN)
	,CONSTRAINT TBL_RNA_ADR_fk1 FOREIGN KEY (ADR_RD_ACD, ADR_EMD_SRN) REFERENCES ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD (ADR_RD_ACD, ADR_EMD_SRN) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION -- 부모테이블.컬럼-자식테이블.컬럼 : 도로명주소_주소_도로명_코드(TBL_RNA_ADR_RDN_CD).주소_도로_주소코드(ADR_RD_ACD) - 도로명주소_주소(TBL_RNA_ADR).주소_도로_주소코드(ADR_RD_ACD)
);



CREATE TABLE ROWDATA_ADDR.TBL_RNA_ADR_LTN( -- 도로명주소_주소_지번 테이블
	ADR_MNN VARCHAR(25) NOT NULL ,  -- 주소_관리번호 - 관리번호_VAR25
	ADR_SRN VARCHAR(10) NOT NULL ,  -- 주소_일련번호 - 일련번호_VAR10
	ADR_LGD_ACD VARCHAR(14)  ,  -- 주소_법정동_주소코드 - 주소코드_VAR14
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200
	ADR_LGL_EMD_NM VARCHAR(200)  ,  -- 주소_법정_읍면동_명칭 - 명칭_VAR200
	ADR_LGL_LI_NM VARCHAR(200)  ,  -- 주소_법정_리_명칭 - 명칭_VAR200
	ADR_MNT_CCD VARCHAR(2)  ,  -- 주소_산_구분코드 - 구분코드_VAR2
	ADR_LTN_ORN_NMB INTEGER  ,  -- 주소_지번_본번_번호 - 번호_INT
	ADR_LTN_VCN_NMB INTEGER  ,  -- 주소_지번_부번_번호 - 번호_INT
	ADR_LTN_CCD VARCHAR(2)  ,  -- 주소_지번_구분코드 - 구분코드_VAR2
	ADR_CHN_CCD VARCHAR(2)  ,  -- 주소_변경_구분코드 - 구분코드_VAR2

	CONSTRAINT TBL_RNA_ADR_LTN_pkey PRIMARY KEY (ADR_MNN, ADR_SRN)
	,CONSTRAINT TBL_RNA_ADR_LTN_fk1 FOREIGN KEY (ADR_MNN) REFERENCES ROWDATA_ADDR.TBL_RNA_ADR (ADR_MNN) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION -- 부모테이블.컬럼-자식테이블.컬럼 : 도로명주소_주소(TBL_RNA_ADR).주소_관리번호(ADR_MNN) - 도로명주소_주소_지번(TBL_RNA_ADR_LTN).주소_관리번호(ADR_MNN)
);



CREATE TABLE ROWDATA_ADDR.TBL_RNA_ADR_ADT( -- 도로명주소_주소_부가 테이블
	ADR_MNN VARCHAR(25) NOT NULL ,  -- 주소_관리번호 - 관리번호_VAR25
	ADR_ADD_ACD VARCHAR(14)  ,  -- 주소_행정동_주소코드 - 주소코드_VAR14
	ADR_ADD_NM VARCHAR(200)  ,  -- 주소_행정동_명칭 - 명칭_VAR200
	ADR_ZPC VARCHAR(6)  ,  -- 주소_우편번호 - 우편번호_VAR6
	ADR_ZPC_SRN VARCHAR(10)  ,  -- 주소_우편번호_일련번호 - 일련번호_VAR10
	ADR_QNT_DLV_LCT_NM VARCHAR(200)  ,  -- 주소_다량_배달_위치_명칭 - 명칭_VAR200
	ADR_BDL_BLD_NM VARCHAR(200)  ,  -- 주소_건축물대장_건물_명칭 - 명칭_VAR200
	ADR_SGG_BLD_NM VARCHAR(200)  ,  -- 주소_시군구_건물_명칭 - 명칭_VAR200
	ADR_APT_CCD VARCHAR(2)  ,  -- 주소_공동주택_구분코드 - 구분코드_VAR2
	ADR_CHN_CCD VARCHAR(2)  ,  -- 주소_변경_구분코드 - 구분코드_VAR2

	CONSTRAINT TBL_RNA_ADR_ADT_pkey PRIMARY KEY (ADR_MNN)
	,CONSTRAINT TBL_RNA_ADR_ADT_fk1 FOREIGN KEY (ADR_MNN) REFERENCES ROWDATA_ADDR.TBL_RNA_ADR (ADR_MNN) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION -- 부모테이블.컬럼-자식테이블.컬럼 : 도로명주소_주소(TBL_RNA_ADR).주소_관리번호(ADR_MNN) - 도로명주소_주소_부가(TBL_RNA_ADR_ADT).주소_관리번호(ADR_MNN)
);




CREATE TABLE ROWDATA_ADDR.TBL_RNA_NVG_BLD( -- 도로명주소_내비게이션_건물 테이블
	ADR_BLD_MNN VARCHAR(25) NOT NULL ,  -- 주소_건물_관리번호 - 관리번호_VAR25
	ADR_JRS_EMD_ACD VARCHAR(14)  ,  -- 주소_관할_읍면동_주소코드 - 주소코드_VAR14
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200
	ADR_EMD_NM VARCHAR(200)  ,  -- 주소_읍면동_명칭 - 명칭_VAR200
	ADR_RD_ACD VARCHAR(14)  ,  -- 주소_도로_주소코드 - 주소코드_VAR14
	ADR_RD_NM VARCHAR(200)  ,  -- 주소_도로_명칭 - 명칭_VAR200
	ADR_UND_CCD VARCHAR(2)  ,  -- 주소_지하_구분코드 - 구분코드_VAR2
	ADR_BLD_ORN_NMB INTEGER  ,  -- 주소_건물_본번_번호 - 번호_INT
	ADR_BLD_VCN_NMB INTEGER  ,  -- 주소_건물_부번_번호 - 번호_INT
	ADR_ZPC VARCHAR(6)  ,  -- 주소_우편번호 - 우편번호_VAR6
	ADR_SGG_BLD_NM VARCHAR(200)  ,  -- 주소_시군구_건물_명칭 - 명칭_VAR200
	ADR_STR_PRP_CNT VARCHAR(1000)  ,  -- 주소_건축물_용도_내용 - 내용_VAR1000
	ADR_ADD_ACD VARCHAR(14)  ,  -- 주소_행정동_주소코드 - 주소코드_VAR14
	ADR_ADD_NM VARCHAR(200)  ,  -- 주소_행정동_명칭 - 명칭_VAR200
	ADR_GRD_FLR_NMR INTEGER  ,  -- 주소_지상_층_개수 - 개수_INT
	ADR_UND_FLR_NMR INTEGER  ,  -- 주소_지하_층_개수 - 개수_INT
	ADR_APT_CCD VARCHAR(2)  ,  -- 주소_공동주택_구분코드 - 구분코드_VAR2
	ADR_SMN_ADR_BLD_NMR INTEGER  ,  -- 주소_동일_주소_건물_개수 - 개수_INT
	ADR_DTL_BLD_NM VARCHAR(200)  ,  -- 주소_상세_건물_명칭 - 명칭_VAR200
	ADR_BLD_NM_CHB_CNT VARCHAR(1000)  ,  -- 주소_건물_명칭_변경내역_내용 - 내용_VAR1000
	ADR_DTA_CHB_CNT VARCHAR(1000)  ,  -- 주소_상세주소_변경내역_내용 - 내용_VAR1000
	ADR_RSD_CCD VARCHAR(2)  ,  -- 주소_거주_구분코드 - 구분코드_VAR2
	ADR_BLD_LTT NUMERIC(15,6)  ,  -- 주소_건물_위도 - 위도_NMR15-6
	ADR_BLD_LNG NUMERIC(15,6)  ,  -- 주소_건물_경도 - 경도_NMR15-6
	ADR_ENT_LTT NUMERIC(15,6)  ,  -- 주소_출입구_위도 - 위도_NMR15-6
	ADR_ENT_LNG NUMERIC(15,6)  ,  -- 주소_출입구_경도 - 경도_NMR15-6
	ADR_CAP_WRE_NM VARCHAR(200)  ,  -- 주소_시도_영문_명칭 - 명칭_VAR200
	ADR_SGG_WRE_NM VARCHAR(200)  ,  -- 주소_시군구_영문_명칭 - 명칭_VAR200
	ADR_EMD_WRE_NM VARCHAR(200)  ,  -- 주소_읍면동_영문_명칭 - 명칭_VAR200
	ADR_RD_WRE_NM VARCHAR(200)  ,  -- 주소_도로_영문_명칭 - 명칭_VAR200
	ADR_EMD_CCD VARCHAR(2)  ,  -- 주소_읍면동_구분코드 - 구분코드_VAR2
	ADR_MPO_CCD VARCHAR(2)  ,  -- 주소_이동사유_구분코드 - 구분코드_VAR2

	CONSTRAINT TBL_RNA_NVG_BLD_pkey PRIMARY KEY (ADR_BLD_MNN)
);



CREATE TABLE ROWDATA_ADDR.TBL_RNA_NVG_LTN( -- 도로명주소_내비게이션_지번 테이블
	ADR_RD_ACD VARCHAR(14) NOT NULL ,  -- 주소_도로_주소코드 - 주소코드_VAR14
	ADR_UND_CCD VARCHAR(2) NOT NULL ,  -- 주소_지하_구분코드 - 구분코드_VAR2
	ADR_BLD_ORN_NMB INTEGER NOT NULL ,  -- 주소_건물_본번_번호 - 번호_INT
	ADR_BLD_VCN_NMB INTEGER NOT NULL ,  -- 주소_건물_부번_번호 - 번호_INT
	ADR_LTN_SRN VARCHAR(10) NOT NULL ,  -- 주소_지번_일련번호 - 일련번호_VAR10
	ADR_JRS_EMD_ACD VARCHAR(14) NOT NULL ,  -- 주소_관할_읍면동_주소코드 - 주소코드_VAR14
	ADR_LGD_ACD VARCHAR(14)  ,  -- 주소_법정동_주소코드 - 주소코드_VAR14
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200
	ADR_EMD_NM VARCHAR(200)  ,  -- 주소_읍면동_명칭 - 명칭_VAR200
	ADR_LI_NM VARCHAR(200)  ,  -- 주소_리_명칭 - 명칭_VAR200
	ADR_MNT_CCD VARCHAR(2)  ,  -- 주소_산_구분코드 - 구분코드_VAR2
	ADR_LTN_ORN_NMB INTEGER  ,  -- 주소_지번_본번_번호 - 번호_INT
	ADR_LTN_VCN_NMB INTEGER  ,  -- 주소_지번_부번_번호 - 번호_INT
	ADR_CAP_WRE_NM VARCHAR(200)  ,  -- 주소_시도_영문_명칭 - 명칭_VAR200
	ADR_SGG_WRE_NM VARCHAR(200)  ,  -- 주소_시군구_영문_명칭 - 명칭_VAR200
	ADR_EMD_WRE_NM VARCHAR(200)  ,  -- 주소_읍면동_영문_명칭 - 명칭_VAR200
	ADR_LI_WRE_NM VARCHAR(200)  ,  -- 주소_리_영문_명칭 - 명칭_VAR200
	ADR_MPO_CCD VARCHAR(2)  ,  -- 주소_이동사유_구분코드 - 구분코드_VAR2
	ADR_BLD_MNN VARCHAR(25)  ,  -- 주소_건물_관리번호 - 관리번호_VAR25

	CONSTRAINT TBL_RNA_NVG_LTN_pkey PRIMARY KEY (ADR_RD_ACD, ADR_UND_CCD, ADR_BLD_ORN_NMB, ADR_BLD_VCN_NMB, ADR_LTN_SRN)
);



CREATE TABLE ROWDATA_ADDR.TBL_RNA_NVG_ASS_ENT( -- 도로명주소_내비게이션_보조_출입구 테이블
	ADR_SGG_ACD VARCHAR(14) NOT NULL ,  -- 주소_시군구_주소코드 - 주소코드_VAR14
	ADR_ENT_SRN VARCHAR(10) NOT NULL ,  -- 주소_출입구_일련번호 - 일련번호_VAR10
	ADR_RD_ACD VARCHAR(14)  ,  -- 주소_도로_주소코드 - 주소코드_VAR14
	ADR_UND_CCD VARCHAR(2)  ,  -- 주소_지하_구분코드 - 구분코드_VAR2
	ADR_BLD_ORN_NMB INTEGER  ,  -- 주소_건물_본번_번호 - 번호_INT
	ADR_BLD_VCN_NMB INTEGER  ,  -- 주소_건물_부번_번호 - 번호_INT
	ADR_LGD_ACD VARCHAR(14)  ,  -- 주소_법정동_주소코드 - 주소코드_VAR14
	ADR_ENT_CCD VARCHAR(2)  ,  -- 주소_출입구_구분코드 - 구분코드_VAR2
	ADR_ENT_LTT NUMERIC(15,6)  ,  -- 주소_출입구_위도 - 위도_NMR15-6
	ADR_ENT_LNG NUMERIC(15,6)  ,  -- 주소_출입구_경도 - 경도_NMR15-6
	ADR_MPO_CCD VARCHAR(2)  ,  -- 주소_이동사유_구분코드 - 구분코드_VAR2

	CONSTRAINT TBL_RNA_NVG_ASS_ENT_pkey PRIMARY KEY (ADR_SGG_ACD, ADR_ENT_SRN)
);



CREATE TABLE ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD( -- 도로명주소_사서함_도로명_코드 테이블
	ADR_SGG_ACD VARCHAR(14) NOT NULL ,  -- 주소_시군구_주소코드 - 주소코드_VAR14
	ADR_RD_SRN VARCHAR(10) NOT NULL ,  -- 주소_도로_일련번호 - 일련번호_VAR10
	ADR_EMD_SRN VARCHAR(10) NOT NULL ,  -- 주소_읍면동_일련번호 - 일련번호_VAR10
	ADR_RD_NM VARCHAR(200)  ,  -- 주소_도로_명칭 - 명칭_VAR200
	ADR_RD_WRE_NM VARCHAR(200)  ,  -- 주소_도로_영문_명칭 - 명칭_VAR200
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200
	ADR_EMD_CCD VARCHAR(2)  ,  -- 주소_읍면동_구분코드 - 구분코드_VAR2
	ADR_EMD_ACD VARCHAR(14)  ,  -- 주소_읍면동_주소코드 - 주소코드_VAR14
	ADR_EMD_NM VARCHAR(200)  ,  -- 주소_읍면동_명칭 - 명칭_VAR200
	ADR_SPP_RD_SRN VARCHAR(10)  ,  -- 주소_상위_도로_일련번호 - 일련번호_VAR10
	ADR_SPP_RD_NM VARCHAR(200)  ,  -- 주소_상위_도로_명칭 - 명칭_VAR200
	ADR_RDN_CD_USE_YN CHAR(1)  ,  -- 주소_도로명_코드_사용_여부 - 여부_CHR1
	ADR_RDN_CD_CHW_CCD VARCHAR(2)  ,  -- 주소_도로명_코드_변경사유_구분코드 - 구분코드_VAR2
	ADR_RDN_CHN_ACD VARCHAR(14)  ,  -- 주소_도로명_변경_주소코드 - 주소코드_VAR14
	ADR_CAP_WRE_NM VARCHAR(200)  ,  -- 주소_시도_영문_명칭 - 명칭_VAR200
	ADR_SGG_WRE_NM VARCHAR(200)  ,  -- 주소_시군구_영문_명칭 - 명칭_VAR200
	ADR_EMD_WRE_NM VARCHAR(200)  ,  -- 주소_읍면동_영문_명칭 - 명칭_VAR200
	ADR_NTF_OGD VARCHAR(8)  ,  -- 주소_고시_원본일자 - 원본일자_VAR8
	ADR_ERS_OGD VARCHAR(8)  ,  -- 주소_말소_원본일자 - 원본일자_VAR8

	CONSTRAINT TBL_RNA_MLB_RDN_CD_pkey PRIMARY KEY (ADR_SGG_ACD, ADR_RD_SRN, ADR_EMD_SRN)
);



CREATE TABLE ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR( -- 도로명주소_사서함_도로명_주소 테이블
	ADR_BLD_MNN VARCHAR(25) NOT NULL ,  -- 주소_건물_관리번호 - 관리번호_VAR25
	ADR_LGD_ACD VARCHAR(14)  ,  -- 주소_법정동_주소코드 - 주소코드_VAR14
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200
	ADR_LGL_EMD_NM VARCHAR(200)  ,  -- 주소_법정_읍면동_명칭 - 명칭_VAR200
	ADR_LGL_LI_NM VARCHAR(200)  ,  -- 주소_법정_리_명칭 - 명칭_VAR200
	ADR_MNT_CCD VARCHAR(2)  ,  -- 주소_산_구분코드 - 구분코드_VAR2
	ADR_LTN_ORN_NMB INTEGER  ,  -- 주소_지번_본번_번호 - 번호_INT
	ADR_LTN_VCN_NMB INTEGER  ,  -- 주소_지번_부번_번호 - 번호_INT
	ADR_RD_ACD VARCHAR(14)  ,  -- 주소_도로_주소코드 - 주소코드_VAR14
	ADR_RD_NM VARCHAR(200)  ,  -- 주소_도로_명칭 - 명칭_VAR200
	ADR_UND_CCD VARCHAR(2)  ,  -- 주소_지하_구분코드 - 구분코드_VAR2
	ADR_BLD_ORN_NMB INTEGER  ,  -- 주소_건물_본번_번호 - 번호_INT
	ADR_BLD_VCN_NMB INTEGER  ,  -- 주소_건물_부번_번호 - 번호_INT
	ADR_BDL_BLD_NM VARCHAR(200)  ,  -- 주소_건축물대장_건물_명칭 - 명칭_VAR200
	ADR_DTL_BLD_NM VARCHAR(200)  ,  -- 주소_상세_건물_명칭 - 명칭_VAR200
	ADR_EMD_SRN VARCHAR(10)  ,  -- 주소_읍면동_일련번호 - 일련번호_VAR10
	ADR_ADD_ACD VARCHAR(14)  ,  -- 주소_행정동_주소코드 - 주소코드_VAR14
	ADR_ADD_NM VARCHAR(200)  ,  -- 주소_행정동_명칭 - 명칭_VAR200
	ADR_ZPC VARCHAR(6)  ,  -- 주소_우편번호 - 우편번호_VAR6
	ADR_PST_SRN VARCHAR(10)  ,  -- 주소_우편_일련번호 - 일련번호_VAR10
	ADR_QNT_DLV_LCT_NM VARCHAR(200)  ,  -- 주소_다량_배달_위치_명칭 - 명칭_VAR200
	ADR_MPO_CCD VARCHAR(2)  ,  -- 주소_이동사유_구분코드 - 구분코드_VAR2
	ADR_NTF_OGD VARCHAR(8)  ,  -- 주소_고시_원본일자 - 원본일자_VAR8
	ADR_CHN_BFR_RNA_NM VARCHAR(200)  ,  -- 주소_변경_이전_도로명주소_명칭 - 명칭_VAR200
	ADR_SGG_BLD_NM VARCHAR(200)  ,  -- 주소_시군구_건물_명칭 - 명칭_VAR200
	ADR_APT_CCD VARCHAR(2)  ,  -- 주소_공동주택_구분코드 - 구분코드_VAR2
	ADR_SDS VARCHAR(5)  ,  -- 주소_국가기초구역번호 - 국가기초구역번호_VAR5
	ADR_DTA_GRN_YN CHAR(1)  ,  -- 주소_상세주소_부여_여부 - 여부_CHR1
	ADR_RM1_CNT VARCHAR(1000)  ,  -- 주소_비고1_내용 - 내용_VAR1000
	ADR_RM2_CNT VARCHAR(1000)  ,  -- 주소_비고2_내용 - 내용_VAR1000

	CONSTRAINT TBL_RNA_MLB_RDN_ADR_pkey PRIMARY KEY (ADR_BLD_MNN)
);



CREATE TABLE ROWDATA_ADDR.TBL_RNA_DTL_ADR( -- 도로명주소_상세_주소 테이블
	ADR_SGG_ACD VARCHAR(14) NOT NULL ,  -- 주소_시군구_주소코드 - 주소코드_VAR14
	ADR_DNG_SRN VARCHAR(10) NOT NULL ,  -- 주소_동_일련번호 - 일련번호_VAR10
	ADR_FLR_SRN VARCHAR(10) NOT NULL ,  -- 주소_층_일련번호 - 일련번호_VAR10
	ADR_HO_SRN VARCHAR(10) NOT NULL ,  -- 주소_호_일련번호 - 일련번호_VAR10
	ADR_HO_SFX_SRN VARCHAR(10) NOT NULL ,  -- 주소_호_접미사_일련번호 - 일련번호_VAR10
	ADR_DNG_NM VARCHAR(200)  ,  -- 주소_동_명칭 - 명칭_VAR200
	ADR_FLR_NM VARCHAR(200)  ,  -- 주소_층_명칭 - 명칭_VAR200
	ADR_HO_NM VARCHAR(200)  ,  -- 주소_호_명칭 - 명칭_VAR200
	ADR_HO_SFX_NM VARCHAR(200)  ,  -- 주소_호_접미사_명칭 - 명칭_VAR200
	ADR_UND_YN CHAR(1)  ,  -- 주소_지하_여부 - 여부_CHR1
	ADR_BLD_MNN VARCHAR(25)  ,  -- 주소_건물_관리번호 - 관리번호_VAR25
	ADR_LGD_ACD VARCHAR(14)  ,  -- 주소_법정동_주소코드 - 주소코드_VAR14
	ADR_RD_ACD VARCHAR(14)  ,  -- 주소_도로_주소코드 - 주소코드_VAR14
	ADR_UND_CCD VARCHAR(2)  ,  -- 주소_지하_구분코드 - 구분코드_VAR2
	ADR_BLD_ORN_NMB INTEGER  ,  -- 주소_건물_본번_번호 - 번호_INT
	ADR_BLD_VCN_NMB INTEGER  ,  -- 주소_건물_부번_번호 - 번호_INT
	ADR_MPO_CCD VARCHAR(2)  ,  -- 주소_이동사유_구분코드 - 구분코드_VAR2

	CONSTRAINT TBL_RNA_DTL_ADR_pkey PRIMARY KEY (ADR_SGG_ACD, ADR_DNG_SRN, ADR_FLR_SRN, ADR_HO_SRN, ADR_HO_SFX_SRN)
);



CREATE TABLE ROWDATA_ADDR.TBL_RNA_LCT_SMR( -- 도로명주소_위치_요약 테이블
	ADR_RD_ACD VARCHAR(14) NOT NULL ,  -- 주소_도로_주소코드 - 주소코드_VAR14
	ADR_UND_CCD VARCHAR(2) NOT NULL ,  -- 주소_지하_구분코드 - 구분코드_VAR2
	ADR_BLD_ORN_NMB INTEGER NOT NULL ,  -- 주소_건물_본번_번호 - 번호_INT
	ADR_BLD_VCN_NMB INTEGER NOT NULL ,  -- 주소_건물_부번_번호 - 번호_INT
	ADR_LGD_ACD VARCHAR(14) NOT NULL ,  -- 주소_법정동_주소코드 - 주소코드_VAR14
	ADR_SGG_ACD VARCHAR(14)  ,  -- 주소_시군구_주소코드 - 주소코드_VAR14
	ADR_ENT_SRN VARCHAR(10)  ,  -- 주소_출입구_일련번호 - 일련번호_VAR10
	ADR_CAP_NM VARCHAR(200)  ,  -- 주소_시도_명칭 - 명칭_VAR200
	ADR_SGG_NM VARCHAR(200)  ,  -- 주소_시군구_명칭 - 명칭_VAR200
	ADR_EMD_NM VARCHAR(200)  ,  -- 주소_읍면동_명칭 - 명칭_VAR200
	ADR_RD_NM VARCHAR(200)  ,  -- 주소_도로_명칭 - 명칭_VAR200
	ADR_BLD_NM VARCHAR(200)  ,  -- 주소_건물_명칭 - 명칭_VAR200
	ADR_ZPC VARCHAR(6)  ,  -- 주소_우편번호 - 우편번호_VAR6
	ADR_STR_PRP_CNT VARCHAR(1000)  ,  -- 주소_건축물_용도_내용 - 내용_VAR1000
	ADR_SNB_CCD VARCHAR(2)  ,  -- 주소_단독건물_구분코드 - 구분코드_VAR2
	ADR_JRS_ADD_NM VARCHAR(200)  ,  -- 주소_관할_행정동_명칭 - 명칭_VAR200
	ADR_LTT NUMERIC(15,6)  ,  -- 주소_위도 - 위도_NMR15-6
	ADR_LNG NUMERIC(15,6)  ,  -- 주소_경도 - 경도_NMR15-6
	ADR_MPO_CCD VARCHAR(2)  ,  -- 주소_이동사유_구분코드 - 구분코드_VAR2

	CONSTRAINT TBL_RNA_LCT_SMR_pkey PRIMARY KEY (ADR_RD_ACD, ADR_UND_CCD, ADR_BLD_ORN_NMB, ADR_BLD_VCN_NMB, ADR_LGD_ACD)
);



CREATE TABLE ROWDATA_ADDR.TBL_LGD_CD( -- 법정동_코드 테이블
	ADR_LGD_ACD VARCHAR(14) NOT NULL ,  -- 주소_법정동_주소코드 - 주소코드_VAR14
	ADR_LGD_NM VARCHAR(200)  ,  -- 주소_법정동_명칭 - 명칭_VAR200
	ADR_ABL_CCD VARCHAR(2)  ,  -- 주소_폐지_구분코드 - 구분코드_VAR2
	ADR_SPP_ARE_ACD VARCHAR(14)  ,  -- 주소_상위_지역_주소코드 - 주소코드_VAR14
	ADR_LGD_CD_ORD VARCHAR(2)  ,  -- 주소_법정동_코드_서열 - 서열_VAR2
	ADR_LGD_CD_CRT_OGD VARCHAR(8)  ,  -- 주소_법정동_코드_생성_원본일자 - 원본일자_VAR8
	ADR_ABL_OGD VARCHAR(8)  ,  -- 주소_폐지_원본일자 - 원본일자_VAR8
	ADR_LST_OPR_OGD VARCHAR(8)  ,  -- 주소_최종_작업_원본일자 - 원본일자_VAR8
	ADR_LWS_ARE_NM VARCHAR(200)  ,  -- 주소_최하_지역_명칭 - 명칭_VAR200
	ADR_LGD_INH_ACD VARCHAR(14)  ,  -- 주소_법정동_주민_주소코드 - 주소코드_VAR14
	ADR_LGD_LNR_ACD VARCHAR(14)  ,  -- 주소_법정동_지적_주소코드 - 주소코드_VAR14

	CONSTRAINT TBL_LGD_CD_pkey PRIMARY KEY (ADR_LGD_ACD)
);

*/



----------------------------------------------------------------------------------------






COMMENT ON TABLE ROWDATA_ADDR.TBL_RNA_BLD IS '도로명주소_건물';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_BLD_MNN IS '주소_건물_관리번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_LGD_ACD IS '주소_법정동_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_CAP_NM IS '주소_시도_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_SGG_NM IS '주소_시군구_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_LGL_EMD_NM IS '주소_법정_읍면동_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_LGL_LI_NM IS '주소_법정_리_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_MNT_CCD IS '주소_산_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_LTN_ORN_NMB IS '주소_지번_본번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_LTN_VCN_NMB IS '주소_지번_부번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_RD_ACD IS '주소_도로_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_RD_NM IS '주소_도로_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_UND_CCD IS '주소_지하_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_BLD_ORN_NMB IS '주소_건물_본번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_BLD_VCN_NMB IS '주소_건물_부번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_BDL_BLD_NM IS '주소_건축물대장_건물_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_DTL_BLD_NM IS '주소_상세_건물_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_EMD_SRN IS '주소_읍면동_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_ADD_ACD IS '주소_행정동_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_ADD_NM IS '주소_행정동_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_ZPC IS '주소_우편번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_PST_SRN IS '주소_우편_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_QNT_DLV_LCT_NM IS '주소_다량_배달_위치_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_MPO_CCD IS '주소_이동사유_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_NTF_OGD IS '주소_고시_원본일자';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_CHN_BFR_RNA_NM IS '주소_변경_이전_도로명주소_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_SGG_BLD_NM IS '주소_시군구_건물_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_APT_CCD IS '주소_공동주택_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_SDS IS '주소_국가기초구역번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_DTA_GRN_YN IS '주소_상세주소_부여_여부';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_RM1_CNT IS '주소_비고1_내용';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD.ADR_RM2_CNT IS '주소_비고2_내용';


COMMENT ON TABLE ROWDATA_ADDR.TBL_RNA_BLD_RLT_LTN IS '도로명주소_건물_관련_지번';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RLT_LTN.ADR_RD_ACD IS '주소_도로_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RLT_LTN.ADR_UND_CCD IS '주소_지하_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RLT_LTN.ADR_BLD_ORN_NMB IS '주소_건물_본번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RLT_LTN.ADR_BLD_VCN_NMB IS '주소_건물_부번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RLT_LTN.ADR_LTN_SRN IS '주소_지번_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RLT_LTN.ADR_LGD_ACD IS '주소_법정동_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RLT_LTN.ADR_CAP_NM IS '주소_시도_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RLT_LTN.ADR_SGG_NM IS '주소_시군구_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RLT_LTN.ADR_LGL_EMD_NM IS '주소_법정_읍면동_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RLT_LTN.ADR_LGL_LI_NM IS '주소_법정_리_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RLT_LTN.ADR_MNT_CCD IS '주소_산_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RLT_LTN.ADR_LTN_ORN_NMB IS '주소_지번_본번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RLT_LTN.ADR_LTN_VCN_NMB IS '주소_지번_부번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RLT_LTN.ADR_MPO_CCD IS '주소_이동사유_구분코드';


COMMENT ON TABLE ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD IS '도로명주소_건물_도로명_코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_SGG_ACD IS '주소_시군구_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_RD_SRN IS '주소_도로_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_EMD_SRN IS '주소_읍면동_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_RD_NM IS '주소_도로_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_RD_WRE_NM IS '주소_도로_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_CAP_NM IS '주소_시도_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_SGG_NM IS '주소_시군구_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_EMD_CCD IS '주소_읍면동_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_EMD_ACD IS '주소_읍면동_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_EMD_NM IS '주소_읍면동_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_SPP_RD_SRN IS '주소_상위_도로_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_SPP_RD_NM IS '주소_상위_도로_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_RDN_CD_USE_YN IS '주소_도로명_코드_사용_여부';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_CHW_CCD IS '주소_변경사유_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_RDN_CHN_ACD IS '주소_도로명_변경_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_CAP_WRE_NM IS '주소_시도_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_SGG_WRE_NM IS '주소_시군구_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_EMD_WRE_NM IS '주소_읍면동_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_NTF_OGD IS '주소_고시_원본일자';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD.ADR_ERS_OGD IS '주소_말소_원본일자';


COMMENT ON TABLE ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD IS '도로명주소_주소_도로명_코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD.ADR_RD_ACD IS '주소_도로_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD.ADR_EMD_SRN IS '주소_읍면동_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD.ADR_RD_NM IS '주소_도로_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD.ADR_RD_WRE_NM IS '주소_도로_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD.ADR_CAP_NM IS '주소_시도_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD.ADR_CAP_WRE_NM IS '주소_시도_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD.ADR_SGG_NM IS '주소_시군구_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD.ADR_SGG_BLD_WRE_NM IS '주소_시군구_건물_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD.ADR_EMD_NM IS '주소_읍면동_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD.ADR_EMD_WRE_NM IS '주소_읍면동_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD.ADR_EMD_CCD IS '주소_읍면동_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD.ADR_EMD_ACD IS '주소_읍면동_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD.ADR_RDN_CD_USE_YN IS '주소_도로명_코드_사용_여부';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD.ADR_RDN_CD_CHW_CCD IS '주소_도로명_코드_변경사유_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD.ADR_RDN_CHN_ACD IS '주소_도로명_변경_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD.ADR_NTF_OGD IS '주소_고시_원본일자';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_RDN_CD.ADR_ERS_OGD IS '주소_말소_원본일자';


COMMENT ON TABLE ROWDATA_ADDR.TBL_RNA_ADR IS '도로명주소_주소';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR.ADR_MNN IS '주소_관리번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR.ADR_RD_ACD IS '주소_도로_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR.ADR_EMD_SRN IS '주소_읍면동_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR.ADR_UND_CCD IS '주소_지하_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR.ADR_BLD_ORN_NMB IS '주소_건물_본번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR.ADR_BLD_VCN_NMB IS '주소_건물_부번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR.ADR_SDS IS '주소_국가기초구역번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR.ADR_CHN_CCD IS '주소_변경_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR.ADR_NTF_OGD IS '주소_고시_원본일자';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR.ADR_CHN_BFR_RNA_NM IS '주소_변경_이전_도로명주소_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR.ADR_DTA_GRN_YN IS '주소_상세주소_부여_여부';


COMMENT ON TABLE ROWDATA_ADDR.TBL_RNA_ADR_LTN IS '도로명주소_주소_지번';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_LTN.ADR_MNN IS '주소_관리번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_LTN.ADR_SRN IS '주소_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_LTN.ADR_LGD_ACD IS '주소_법정동_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_LTN.ADR_CAP_NM IS '주소_시도_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_LTN.ADR_SGG_NM IS '주소_시군구_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_LTN.ADR_LGL_EMD_NM IS '주소_법정_읍면동_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_LTN.ADR_LGL_LI_NM IS '주소_법정_리_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_LTN.ADR_MNT_CCD IS '주소_산_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_LTN.ADR_LTN_ORN_NMB IS '주소_지번_본번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_LTN.ADR_LTN_VCN_NMB IS '주소_지번_부번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_LTN.ADR_LTN_CCD IS '주소_지번_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_LTN.ADR_CHN_CCD IS '주소_변경_구분코드';


COMMENT ON TABLE ROWDATA_ADDR.TBL_RNA_ADR_ADT IS '도로명주소_주소_부가';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_ADT.ADR_MNN IS '주소_관리번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_ADT.ADR_ADD_ACD IS '주소_행정동_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_ADT.ADR_ADD_NM IS '주소_행정동_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_ADT.ADR_ZPC IS '주소_우편번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_ADT.ADR_ZPC_SRN IS '주소_우편번호_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_ADT.ADR_QNT_DLV_LCT_NM IS '주소_다량_배달_위치_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_ADT.ADR_BDL_BLD_NM IS '주소_건축물대장_건물_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_ADT.ADR_SGG_BLD_NM IS '주소_시군구_건물_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_ADT.ADR_APT_CCD IS '주소_공동주택_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_ADR_ADT.ADR_CHN_CCD IS '주소_변경_구분코드';


COMMENT ON TABLE ROWDATA_ADDR.TBL_RNA_NVG_BLD IS '도로명주소_내비게이션_건물';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_BLD_MNN IS '주소_건물_관리번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_JRS_EMD_ACD IS '주소_관할_읍면동_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_CAP_NM IS '주소_시도_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_SGG_NM IS '주소_시군구_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_EMD_NM IS '주소_읍면동_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_RD_ACD IS '주소_도로_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_RD_NM IS '주소_도로_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_UND_CCD IS '주소_지하_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_BLD_ORN_NMB IS '주소_건물_본번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_BLD_VCN_NMB IS '주소_건물_부번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_ZPC IS '주소_우편번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_SGG_BLD_NM IS '주소_시군구_건물_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_STR_PRP_CNT IS '주소_건축물_용도_내용';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_ADD_ACD IS '주소_행정동_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_ADD_NM IS '주소_행정동_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_GRD_FLR_NMR IS '주소_지상_층_개수';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_UND_FLR_NMR IS '주소_지하_층_개수';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_APT_CCD IS '주소_공동주택_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_SMN_ADR_BLD_NMR IS '주소_동일_주소_건물_개수';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_DTL_BLD_NM IS '주소_상세_건물_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_BLD_NM_CHB_CNT IS '주소_건물_명칭_변경내역_내용';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_DTA_CHB_CNT IS '주소_상세주소_변경내역_내용';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_RSD_CCD IS '주소_거주_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_BLD_LTT IS '주소_건물_위도';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_BLD_LNG IS '주소_건물_경도';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_ENT_LTT IS '주소_출입구_위도';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_ENT_LNG IS '주소_출입구_경도';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_CAP_WRE_NM IS '주소_시도_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_SGG_WRE_NM IS '주소_시군구_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_EMD_WRE_NM IS '주소_읍면동_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_RD_WRE_NM IS '주소_도로_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_EMD_CCD IS '주소_읍면동_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_BLD.ADR_MPO_CCD IS '주소_이동사유_구분코드';


COMMENT ON TABLE ROWDATA_ADDR.TBL_RNA_NVG_LTN IS '도로명주소_내비게이션_지번';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_RD_ACD IS '주소_도로_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_UND_CCD IS '주소_지하_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_BLD_ORN_NMB IS '주소_건물_본번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_BLD_VCN_NMB IS '주소_건물_부번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_LTN_SRN IS '주소_지번_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_JRS_EMD_ACD IS '주소_관할_읍면동_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_LGD_ACD IS '주소_법정동_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_CAP_NM IS '주소_시도_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_SGG_NM IS '주소_시군구_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_EMD_NM IS '주소_읍면동_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_LI_NM IS '주소_리_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_MNT_CCD IS '주소_산_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_LTN_ORN_NMB IS '주소_지번_본번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_LTN_VCN_NMB IS '주소_지번_부번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_CAP_WRE_NM IS '주소_시도_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_SGG_WRE_NM IS '주소_시군구_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_EMD_WRE_NM IS '주소_읍면동_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_LI_WRE_NM IS '주소_리_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_MPO_CCD IS '주소_이동사유_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_LTN.ADR_BLD_MNN IS '주소_건물_관리번호';


COMMENT ON TABLE ROWDATA_ADDR.TBL_RNA_NVG_ASS_ENT IS '도로명주소_내비게이션_보조_출입구';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_ASS_ENT.ADR_SGG_ACD IS '주소_시군구_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_ASS_ENT.ADR_ENT_SRN IS '주소_출입구_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_ASS_ENT.ADR_RD_ACD IS '주소_도로_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_ASS_ENT.ADR_UND_CCD IS '주소_지하_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_ASS_ENT.ADR_BLD_ORN_NMB IS '주소_건물_본번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_ASS_ENT.ADR_BLD_VCN_NMB IS '주소_건물_부번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_ASS_ENT.ADR_LGD_ACD IS '주소_법정동_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_ASS_ENT.ADR_ENT_CCD IS '주소_출입구_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_ASS_ENT.ADR_ENT_LTT IS '주소_출입구_위도';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_ASS_ENT.ADR_ENT_LNG IS '주소_출입구_경도';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_NVG_ASS_ENT.ADR_MPO_CCD IS '주소_이동사유_구분코드';


COMMENT ON TABLE ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD IS '도로명주소_사서함_도로명_코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_SGG_ACD IS '주소_시군구_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_RD_SRN IS '주소_도로_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_EMD_SRN IS '주소_읍면동_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_RD_NM IS '주소_도로_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_RD_WRE_NM IS '주소_도로_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_CAP_NM IS '주소_시도_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_SGG_NM IS '주소_시군구_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_EMD_CCD IS '주소_읍면동_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_EMD_ACD IS '주소_읍면동_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_EMD_NM IS '주소_읍면동_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_SPP_RD_SRN IS '주소_상위_도로_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_SPP_RD_NM IS '주소_상위_도로_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_RDN_CD_USE_YN IS '주소_도로명_코드_사용_여부';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_RDN_CD_CHW_CCD IS '주소_도로명_코드_변경사유_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_RDN_CHN_ACD IS '주소_도로명_변경_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_CAP_WRE_NM IS '주소_시도_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_SGG_WRE_NM IS '주소_시군구_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_EMD_WRE_NM IS '주소_읍면동_영문_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_NTF_OGD IS '주소_고시_원본일자';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_CD.ADR_ERS_OGD IS '주소_말소_원본일자';


COMMENT ON TABLE ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR IS '도로명주소_사서함_도로명_주소';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_BLD_MNN IS '주소_건물_관리번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_LGD_ACD IS '주소_법정동_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_CAP_NM IS '주소_시도_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_SGG_NM IS '주소_시군구_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_LGL_EMD_NM IS '주소_법정_읍면동_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_LGL_LI_NM IS '주소_법정_리_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_MNT_CCD IS '주소_산_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_LTN_ORN_NMB IS '주소_지번_본번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_LTN_VCN_NMB IS '주소_지번_부번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_RD_ACD IS '주소_도로_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_RD_NM IS '주소_도로_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_UND_CCD IS '주소_지하_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_BLD_ORN_NMB IS '주소_건물_본번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_BLD_VCN_NMB IS '주소_건물_부번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_BDL_BLD_NM IS '주소_건축물대장_건물_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_DTL_BLD_NM IS '주소_상세_건물_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_EMD_SRN IS '주소_읍면동_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_ADD_ACD IS '주소_행정동_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_ADD_NM IS '주소_행정동_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_ZPC IS '주소_우편번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_PST_SRN IS '주소_우편_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_QNT_DLV_LCT_NM IS '주소_다량_배달_위치_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_MPO_CCD IS '주소_이동사유_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_NTF_OGD IS '주소_고시_원본일자';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_CHN_BFR_RNA_NM IS '주소_변경_이전_도로명주소_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_SGG_BLD_NM IS '주소_시군구_건물_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_APT_CCD IS '주소_공동주택_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_SDS IS '주소_국가기초구역번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_DTA_GRN_YN IS '주소_상세주소_부여_여부';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_RM1_CNT IS '주소_비고1_내용';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_MLB_RDN_ADR.ADR_RM2_CNT IS '주소_비고2_내용';


COMMENT ON TABLE ROWDATA_ADDR.TBL_RNA_DTL_ADR IS '도로명주소_상세_주소';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_DTL_ADR.ADR_SGG_ACD IS '주소_시군구_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_DTL_ADR.ADR_DNG_SRN IS '주소_동_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_DTL_ADR.ADR_FLR_SRN IS '주소_층_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_DTL_ADR.ADR_HO_SRN IS '주소_호_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_DTL_ADR.ADR_HO_SFX_SRN IS '주소_호_접미사_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_DTL_ADR.ADR_DNG_NM IS '주소_동_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_DTL_ADR.ADR_FLR_NM IS '주소_층_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_DTL_ADR.ADR_HO_NM IS '주소_호_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_DTL_ADR.ADR_HO_SFX_NM IS '주소_호_접미사_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_DTL_ADR.ADR_UND_YN IS '주소_지하_여부';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_DTL_ADR.ADR_BLD_MNN IS '주소_건물_관리번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_DTL_ADR.ADR_LGD_ACD IS '주소_법정동_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_DTL_ADR.ADR_RD_ACD IS '주소_도로_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_DTL_ADR.ADR_UND_CCD IS '주소_지하_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_DTL_ADR.ADR_BLD_ORN_NMB IS '주소_건물_본번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_DTL_ADR.ADR_BLD_VCN_NMB IS '주소_건물_부번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_DTL_ADR.ADR_MPO_CCD IS '주소_이동사유_구분코드';


COMMENT ON TABLE ROWDATA_ADDR.TBL_RNA_LCT_SMR IS '도로명주소_위치_요약';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_RD_ACD IS '주소_도로_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_UND_CCD IS '주소_지하_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_BLD_ORN_NMB IS '주소_건물_본번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_BLD_VCN_NMB IS '주소_건물_부번_번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_LGD_ACD IS '주소_법정동_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_SGG_ACD IS '주소_시군구_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_ENT_SRN IS '주소_출입구_일련번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_CAP_NM IS '주소_시도_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_SGG_NM IS '주소_시군구_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_EMD_NM IS '주소_읍면동_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_RD_NM IS '주소_도로_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_BLD_NM IS '주소_건물_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_ZPC IS '주소_우편번호';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_STR_PRP_CNT IS '주소_건축물_용도_내용';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_SNB_CCD IS '주소_단독건물_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_JRS_ADD_NM IS '주소_관할_행정동_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_LTT IS '주소_위도';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_LNG IS '주소_경도';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_RNA_LCT_SMR.ADR_MPO_CCD IS '주소_이동사유_구분코드';


COMMENT ON TABLE ROWDATA_ADDR.TBL_LGD_CD IS '법정동_코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_LGD_CD.ADR_LGD_ACD IS '주소_법정동_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_LGD_CD.ADR_LGD_NM IS '주소_법정동_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_LGD_CD.ADR_ABL_CCD IS '주소_폐지_구분코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_LGD_CD.ADR_SPP_ARE_ACD IS '주소_상위_지역_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_LGD_CD.ADR_LGD_CD_ORD IS '주소_법정동_코드_서열';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_LGD_CD.ADR_LGD_CD_CRT_OGD IS '주소_법정동_코드_생성_원본일자';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_LGD_CD.ADR_ABL_OGD IS '주소_폐지_원본일자';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_LGD_CD.ADR_LST_OPR_OGD IS '주소_최종_작업_원본일자';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_LGD_CD.ADR_LWS_ARE_NM IS '주소_최하_지역_명칭';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_LGD_CD.ADR_LGD_INH_ACD IS '주소_법정동_주민_주소코드';
COMMENT ON COLUMN ROWDATA_ADDR.TBL_LGD_CD.ADR_LGD_LNR_ACD IS '주소_법정동_지적_주소코드';
