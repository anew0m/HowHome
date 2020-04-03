# 라이브러리
import requests
import xmltodict
import json

# 테스팅 관련 변수
#TEST_YN      = True
TEST_YN      = False

# 공공데이터 포털 API 호출관련 기본 변수
SERVICE_KEY  = 'b7Ay2jwUBbbHGzDptlDaR7B83mmW2XLVK5h47oUOoQ%2B55%2BWih2xeKY2UwdxQUrB%2FE841WTI8s6EmSRCFQ7GZLQ%3D%3D'
PAGE_NO      = '1'     # 페이지번호
NUM_OF_ROWS  = '1000'  # 페이지내목록수

# 에러관련 변수
ERR_STATUS_CODE  = "ERR_STATUS_CODE"
ERR_RESULT_CODE  = "ERR_RESULT_CODE"

# API 별 URL 생성 및 호출하여 Json 데이터 반환
def get_json_data_from_public_data_api ( api_type, data_code, data_ymd ) :
    url       = get_url_from_public_data_api ( api_type, data_code, data_ymd )
    json_obj  = trans_url_to_json ( url )
    return json_obj

"""
공공데이터 포털 API의 URL 가져오기

api_type 
10 == 아파트매매 실거래 상세 자료
11 == 아파트(도로명) 목록
12 == 아파트(법정동) 목록
13 == 아파트 기본정보
"""
def get_url_from_public_data_api( api_type, data_code, data_ymd ) :
    url = ''

    if ( api_type == '10' ) :
        """
        '아파트매매 실거래 상세 자료' API 호출을 위한 URL 생성
        https://www.data.go.kr/dataset/3050988/openapi.do
    
        ## NN -> 필수(notNull)
        serviceKey NN 서비스키
        pageNo        페이지 번호
        numOfRows     한 페이지 결과 수
        LAWD_CD    NN 지역코드
        DEAL_YMD   NN 계약월
        """
        url = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev?serviceKey={}&pageNo={}&numOfRows={}&LAWD_CD={}&DEAL_YMD={}" \
            .format(SERVICE_KEY, PAGE_NO, NUM_OF_ROWS, data_code, data_ymd)

    elif ( api_type == '11' ) :
        """
        '아파트(도로명) 목록 ' API 호출을 위한 URL 생성
        https://www.data.go.kr/dataset/3039714/openapi.do
    
        ## NN -> 필수(notNull)
        serviceKey NN 서비스키
        pageNo        페이지 번호
        numOfRows     한 페이지 결과 수
        roadCode   MM 도로명코드(12자리(시군구번호+도로명번호))
        """
        url = 'http://apis.data.go.kr/1611000/AptListService/getRoadnameAptList?serviceKey={}&pageNo={}&numOfRows={}&roadCode={}'\
            .format(SERVICE_KEY, PAGE_NO, NUM_OF_ROWS, data_code)

    elif ( api_type == '12' ) :
        """
        '아파트(법정동) 목록 ' API 호출을 위한 URL 생성
        https://www.data.go.kr/dataset/3039714/openapi.do
    
        ## NN -> 필수(notNull)
        serviceKey NN 서비스키
        pageNo        페이지 번호
        numOfRows     한 페이지 결과 수
        bjdCode   MM 법정동코드(12자리(시군구번호+법정동번호))
        """
        url = 'http://apis.data.go.kr/1611000/AptListService/getLegaldongAptList?serviceKey={}&pageNo={}&numOfRows={}&bjdCode={}'\
            .format(SERVICE_KEY, PAGE_NO, NUM_OF_ROWS, data_code)

    elif ( api_type == '13' ) :
        """
        '아파트 기본정보 ' API 호출을 위한 URL 생성
        https://www.data.go.kr/dataset/3039714/openapi.do
    
        ## NN -> 필수(notNull)
        serviceKey NN 서비스키
        kaptCode   MM 단지코드
        """
        url = 'http://apis.data.go.kr/1611000/AptBasisInfoService/getAphusBassInfo?serviceKey={}&kaptCode={}'\
            .format(SERVICE_KEY, data_code)

    if( TEST_YN ) :
        print("START : get_url_from_public_data_api")
        print(" - api_type  : ", api_type )
        print(" - data_code : ", data_code)
        print(" - data_ymd  : ", data_ymd )
        print(" - url       : ", url )
        print("END : get_url_from_public_data_api")

    return url

"""
URL을 통해 API를 호출하여 결과값 JSON으로 생성
"""
def trans_url_to_json ( url ) :
    if( TEST_YN ) :
        print("START : trans_url_to_json")

    response = requests.get(url)

    if( TEST_YN ) :
        print(" - response    : ", response)
        print(" - status code : ", response.status_code)

    # Err 체크
    if( response.status_code != 200 ) :
        return ERR_STATUS_CODE

    response = response.content

    if ( TEST_YN ):
        print(" - response    : ", response)

    dict = xmltodict.parse(response)

    if( TEST_YN ) :
        print(" - dict        : ", dict)
        print(" - resultCode  : ", json.dumps(dict['response']['header']['resultCode']))

    # Err 체크
    if( json.dumps(dict['response']['header']['resultCode'], ensure_ascii=False) != "\"00\"" ) :
        #if( resultCode != "\"00\"" ) :
        return ERR_RESULT_CODE

    json_str = json.dumps(dict['response']['body'], ensure_ascii=False)
    json_obj = json.loads(json_str)

    if( TEST_YN ) :
        print(" - dict        : ", dict)
        print(" - json_obj    : ", json_obj)

    if (TEST_YN):
        print("END : trans_url_to_json")

    return json_obj

