import requests, xmltodict, json
import pandas as pd

# 테스팅 관련 변수
testYn      = True
#testYn      = False

# 공공데이터 포털 API 호출관련 기본 변수
serviceKey  = "1UUVwM6YiEySmXbqM%2FLN2f3ZP%2F90D7WxGIsw8ROq1eSkW36ZJuS4YMXKAX12UF2SQtXoZ700EadKIRu2fUp7Ew%3D%3D"
pageNo      = "1"   # 페이지번호
numOfRows   = "100"  # 페이지내목록수

# 아파트목록 관련 변수
roadCode    = "263802006002"    # 도로명코드
bjdCode     = "2638010100"      # 법정동코드

# 아파트 기본정보 관련 변수
kaptCode    = "A10027875"

# 아파트 실거래 관련 변수
LAWD_CD     = "11110"   # 지역코드
DEAL_YMD    = "201512"  # 계약년월

# 에러관련 변수
ERR_STATUS_CODE  = "ERR_STATUS_CODE"
ERR_RESULT_CODE  = "ERR_RESULT_CODE"



"""
'아파트(도로명) 목록 ' API 호출을 위한 URL 생성
https://www.data.go.kr/dataset/3039714/openapi.do

## NN -> 필수(notNull)
serviceKey NN 서비스키
roadCode   MM 도로명코드(12자리(시군구번호+도로명번호))
pageNo        페이지 번호
numOfRows     한 페이지 결과 수
"""
def getStrFromAptListInfoRoadUrl( testYn, serviceKey, roadCode, pageNo, numOfRows ) :
    url = "http://apis.data.go.kr/1611000/AptListService/getRoadnameAptList?serviceKey={}&roadCode={}&pageNo={}&numOfRows={}".format(serviceKey, roadCode, pageNo, numOfRows)
    return url

"""
'아파트(법정동) 목록 ' API 호출을 위한 URL 생성
https://www.data.go.kr/dataset/3039714/openapi.do

## NN -> 필수(notNull)
serviceKey NN 서비스키
roadCode   MM 도로명코드(12자리(시군구번호+도로명번호))
pageNo        페이지 번호
numOfRows     한 페이지 결과 수
"""
def getStrFromAptListInfoBjdUrl( testYn, serviceKey, bjdCode, pageNo, numOfRows ) :
    url = "http://apis.data.go.kr/1611000/AptListService/getLegaldongAptList?serviceKey={}&bjdCode={}&pageNo={}&numOfRows={}".format(serviceKey, bjdCode, pageNo, numOfRows)
    return url



"""
'아파트 기본정보 ' API 호출을 위한 URL 생성
https://www.data.go.kr/dataset/3039714/openapi.do

## NN -> 필수(notNull)
serviceKey NN 서비스키
kaptCode   MM 단지코드
"""
def getStrFromAptInfoUrl( testYn, serviceKey, kaptCode ) :
    url = "http://apis.data.go.kr/1611000/AptBasisInfoService/getAphusBassInfo?serviceKey={}&kaptCode={}".format(serviceKey, kaptCode)
    return url



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
def getStrFromAptTradeInfoUrl( testYn, serviceKey, pageNo, numOfRows, LAWD_CD, DEAL_YMD ) :
    url = "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev?serviceKey={}&pageNo={}&numOfRows={}&LAWD_CD={}&DEAL_YMD={}".format(serviceKey, pageNo, numOfRows, LAWD_CD, DEAL_YMD)
    return url



"""
URL을 통해 API를 호출하여 결과값 JSON으로 생성
"""
def getJsonFromUrlContent( url ) :
    response = requests.get(url)
    if( testYn == True ) :
        print("response")
        print(response)
        print("status code :", response.status_code)

    # Err 체크
    if( response.status_code != 200 ) :
        return ERR_STATUS_CODE

    response = response.content
    if (testYn == True):
        print("response")
        print(response)

    dict = xmltodict.parse(response)
    if( testYn == True ) :
        print("dict")
        print(dict)
        print("resultCode :", json.dumps(dict['response']['header']['resultCode']))

    resultCode = json.dumps(dict['response']['header']['resultCode'], ensure_ascii=False)
    print(resultCode)
    # Err 체크
    if( json.dumps(dict['response']['header']['resultCode'], ensure_ascii=False) != "\"00\"" ) :
    #if( resultCode != "\"00\"" ) :
        return ERR_RESULT_CODE

    jsonString = json.dumps(dict['response']['body'], ensure_ascii=False)
    jsonObj = json.loads(jsonString)
    if( testYn == True ) :
        print("jsonObj")
        print(jsonObj)

    return jsonObj


def checkJsonObj( jsonObj ) :
    ERR_STATUS_CODE = "ERR_STATUS_CODE"
    ERR_RESULT_CODE = "ERR_RESULT_CODE"

    if( jsonObj == ERR_STATUS_CODE ) :
        return False
    elif( jsonObj == ERR_RESULT_CODE ) :
        return False
    else :
        return True

"""
JSON 데이터를 CSV 파일로 변환
"""
def createCsvFileFromJson( jsonObj ) :
    df = pd.DataFrame(jsonObj)
    df.to_csv('aptTest.csv', header=True, index=True, encoding='UTF-8')

#url = getStrFromAptListInfoRoadUrl( testYn, serviceKey, roadCode, pageNo, numOfRows )          # 아파트목록(도로명)
#url = getStrFromAptListInfoBjdUrl( testYn, serviceKey, bjdCode, pageNo, numOfRows )            # 아파트목록(법정동)
#url = getStrFromAptInfoUrl( testYn, serviceKey, kaptCode )
url = getStrFromAptTradeInfoUrl( testYn, serviceKey, pageNo, numOfRows, LAWD_CD, DEAL_YMD )    # 아파트실거래정보
jsonObj = getJsonFromUrlContent(url)


#print(jsonObj['item'])

if ( checkJsonObj(jsonObj) ) :
    createCsvFileFromJson( jsonObj )    ## JSON to CSV File
    for item in jsonObj['items']['item'] :
        print(item)
else :
    print("ERR")
