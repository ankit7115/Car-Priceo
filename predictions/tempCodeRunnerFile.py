import numpy as np
import pandas as pd
import pickle

model = pickle.load(open("/Users/ankitsrivastava/ImpFolders/flutter_project/MyCar_dtcom/connectdjango/backend/prediction_model/LinearRegressionModel.pkl",'rb'))

company = "Audi"
carModel = "Audi A8"
yer = 2002
fuel_type = "Petrol"
km = 10000
prediction = model.predict(pd.DataFrame([[carModel,company,yer,km,fuel_type]])),
print(prediction)