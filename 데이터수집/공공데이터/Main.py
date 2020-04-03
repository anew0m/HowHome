# 라이브러리
import datetime
import time
# 다른파일
import PublicDataApi
import MakeCsvFile
import DbConn

TODAY_YMD     = datetime.datetime.now().strftime('%Y%m%d')
YESTERDAY_YMD = (datetime.datetime.now() - datetime.timedelta(1)).strftime('%Y%m%d')


"""
api_type 
10 == 아파트매매 실거래 상세 자료
11 == 아파트(도로명) 목록
12 == 아파트(법정동) 목록
13 == 아파트 기본정보
"""

TEST = False

cnt       = 0
total_cnt = 17529

api_type = '13'
data_ymd = YESTERDAY_YMD

if TEST == False:
    data_code_list = DbConn.select_data_code ( api_type )

    for data_code in data_code_list :
        print(str(cnt)+ "/" + str(total_cnt) + " : " + data_code[0])

        json_obj = PublicDataApi.get_json_data_from_public_data_api( api_type, data_code[0], data_ymd )

        if ( api_type == '13' ) :
            MakeCsvFile.save_json_to_csv_file( api_type, data_code[0], data_ymd, json_obj['item'], 1 )
            MakeCsvFile.save_json_to_log_file( api_type, data_code[0], data_ymd, json_obj['item'], 1 )

        else :
            print("totalCount : ", json_obj['totalCount'])


            # api 호출 결과가 1건 이상일 경우에만 CSV/DB 저장
            if int(json_obj['totalCount']) >= 1:
                MakeCsvFile.save_json_to_csv_file( api_type, data_code[0], data_ymd, json_obj['items']['item'], int(json_obj['totalCount']) )

        cnt = cnt + 1
        time.sleep(2)

elif TEST == True:
    #json_obj = PublicDataApi.get_json_data_from_public_data_api(api_type, '4211010200', data_ymd)
    json_obj = PublicDataApi.get_json_data_from_public_data_api(api_type, '2638010100', data_ymd)

    if int(json_obj['totalCount']) >= 1:
        MakeCsvFile.save_json_to_csv_file( api_type, '4211010200', data_ymd, json_obj['items']['item'], int(json_obj['totalCount']) )
