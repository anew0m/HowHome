import psycopg2
import pandas as pd

HOST      = 'swad.asuscomm.com'
PORT      = '42601'
DB_NAME   = 'postgres'
USER      = 'postgres'
PASSWORD  = 'postgres'
#ENCODING  = 'UTF-8'
CONN_INFO = "host='{}' port='{}' dbname ='{}' user='{}' password='{}' "\
    .format(HOST, PORT, DB_NAME, USER, PASSWORD)
LIMIT     = '3'
OFFSET    = '0'


# API 별 데이터 코드 조회 및 반환
def select_data_code ( api_type ) :
    conn  = psycopg2.connect(CONN_INFO)
    cur   = conn.cursor()
    query = ''



    """
    api_type 
    10 == 아파트매매 실거래 상세 자료
    11 == 아파트(도로명) 목록
    12 == 아파트(법정동) 목록
    13 == 아파트 기본정보
    """
    if ( api_type == '10' ) :
        query = "SELECT DISTINCT LEFT(ADR_LGD_ACD, 5) AS LAWD_CD FROM ROWDATA_ADDR.TBL_LGD_CD LIMIT {} OFFSET {}"\
            .format(LIMIT, OFFSET)
    elif ( api_type == '11' ) :
        query = "SELECT (ADR_SGG_ACD || ADR_RD_SRN) AS ROAD_CD FROM ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD LIMIT {} OFFSET {}"\
            .format(LIMIT, OFFSET)
    elif ( api_type == '12' ) :
        query = "SELECT ADR_LGD_ACD AS BJD_CD FROM ROWDATA_ADDR.TBL_LGD_CD LIMIT {} OFFSET {}"\
            .format(LIMIT, OFFSET)
    elif ( api_type == '13' ) :
        """
        '아파트 기본정보 ' API 호출을 위한 URL 생성
        https://www.data.go.kr/dataset/3039714/openapi.do

        ## NN -> 필수(notNull)
        serviceKey NN 서비스키
        kaptCode   MM 단지코드
        """
        query = "SELECT APT_HCD AS kaptCode FROM ROWDATA_ADDR.TBL_APT_LIS_LGD LIMIT {} OFFSET {}"\
            .format(LIMIT, OFFSET)

    cur.execute(query)

    #data_code = cur.fetchone()    ) # 단건
    query_result = cur.fetchall()    # 다건
    #query_result_dataframe    = pd.DataFrame(cur.fetchall())
    #query_result_column_names = [desc[0] for desc in cur.description]
    #data_code_dataframe .columns = [desc[0] for desc in cur.description]


    cur.close()
    conn.close()

    #return data_code[0]
    #return '263802006002'
    return query_result

# API 별 json_obj 데이터 DB 저장
""" 작업중 """
def insert_public_data_list ( api_type, json_obj ) :
    conn  = psycopg2.connect(CONN_INFO)
    cur   = conn.cursor()
    query = ''

    """
    api_type 
    10 == 아파트매매 실거래 상세 자료
    11 == 아파트(도로명) 목록
    12 == 아파트(법정동) 목록
    13 == 아파트 기본정보
    """
    if ( api_type == '10' ) :
        query = "SELECT DISTINCT LEFT(ADR_LGD_ACD, 5) AS LAWD_CD FROM ROWDATA_ADDR.TBL_LGD_CD LIMIT {} OFFSET {}"\
            .format(LIMIT, OFFSET)
    elif ( api_type == '11' ) :
        query = "SELECT (ADR_SGG_ACD || ADR_RD_SRN) AS ROAD_CD FROM ROWDATA_ADDR.TBL_RNA_BLD_RDN_CD LIMIT {} OFFSET {}"\
            .format(LIMIT, OFFSET)
    elif ( api_type == '12' ) :
        query = "SELECT ADR_LGD_ACD AS BJD_CD FROM ROWDATA_ADDR.TBL_LGD_CD LIMIT {} OFFSET {}"\
            .format(LIMIT, OFFSET)
    elif ( api_type == '13' ) :
        """
        '아파트 기본정보 ' API 호출을 위한 URL 생성
        https://www.data.go.kr/dataset/3039714/openapi.do

        ## NN -> 필수(notNull)
        serviceKey NN 서비스키
        kaptCode   MM 단지코드
        """
        query = ""

    cur.execute(query)

    #data_code = cur.fetchone()    ) # 단건
    query_result = cur.fetchall()    # 다건
    #query_result_dataframe    = pd.DataFrame(cur.fetchall())
    #query_result_column_names = [desc[0] for desc in cur.description]
    #data_code_dataframe .columns = [desc[0] for desc in cur.description]


    cur.close()
    conn.close()

    #return data_code[0]
    #return '263802006002'
    return query_result
