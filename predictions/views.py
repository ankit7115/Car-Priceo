from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json
import numpy as np
import pandas as pd
import pickle

model = pickle.load(open("/Users/ankitsrivastava/ImpFolders/flutter_project/MyCar_dtcom/connectdjango/backend/prediction_model/LinearRegressionModel.pkl",'rb'))


@csrf_exempt
def receive_data(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        car_name = data.get('carName', '')
        car_model = data.get('carModel', '')
        year = int(data.get('year', ''))
        fuel_type = data.get('fuel_type','')
        kmdriven = int(data.get('km_driven',''))
        
        processed_data = model.predict(pd.DataFrame([[car_model,car_name,year,kmdriven,fuel_type]],
                                                     columns = ['name','company','year','kms_driven','fuel_type']))
        # Assuming processed_data is a NumPy array or a Pandas Series, convert it to a scalar
        prediction_result = processed_data[0]

        # Send the processed data back to Flutter
        return JsonResponse({'predictionResult': prediction_result})

    return JsonResponse({'error': 'Invalid request method'})