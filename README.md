# Skin Disease Prediction API

## Project Overview
API for skin disease prediction, deployed on Google Cloud Run and integrated with Cloud Storage, Cloud SQL and Firebase.

## Setup & Development
### Prerequisites
- Python 3.9+
- Virtual environment

### Configuration
- Firebase Service Account: `src/firebase/firebaseService.json`
- Firebase Config: `src/static/firebase/firebaseConfig.json`

### Installation
```bash
# Create virtual environment
python -m venv bioface_env

# Activate environment
bioface_env\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

### Local Execution
```bash
python src/app.py
```
## Main Architecture
<img src="https://drive.google.com/uc?id=1YiV_-mq8BVe94Z4zQ3iowP18P_IWYt6a" alt="Main Architecthure" width="1000">

## Bioface Model API Architecture 
<img src="https://drive.google.com/uc?id=1zL6iJezdJAxMl-5yILwl04V_Orr7jPfN" alt="Bioface Model API Architecture" width="1000">

## Cost Estimation
`https://cloud.google.com/products/calculator/estimate-preview/CiRkZWU1YTVlYi1lNGIyLTQzYjgtYjRiMy04MTBjYzlkNTYyOTAQAQ==?hl=id`

## Infrastructure
- **Deployment**: Cloud Run
- **Model & Data Storage**: Cloud Storage
- **Repository Image**: Artifact Registry
- **Data History**: Cloud SQL

## API Endpoints
### Base URL
`https://bioface-model-api-542945642521.asia-southeast2.run.app/`

### Postman Collection
`https://elements.getpostman.com/redirect?entityId=29523529-13362b96-8cfe-4989-9cf8-c9069ae18a39&entityType=collection`

### Available Routes
| Endpoint | Method | Description |
|----------|--------|-------------|
| `/` | - | Main endpoint (Swagger) |
| `/auth` | - | Generate Firebase token login |
| `/health` | GET | Check API health status |
| `/prediction` | POST | Predict skin disease from image |
| `/history` | GET | Retrieve user prediction history |
| `/history/{id}` | GET | Retrieve specific user history |
| `/history/delete-all` | DELETE | Remove all user history |
| `/history/{id}` | DELETE | Remove specific history entry |

### Responses API
<details>
  <summary><h3>Main</h3></summary>
  <img src="https://drive.google.com/uc?id=1i_w7ALiqrod3y6NHIHf8GSv55sU1Dkxe" alt="flask-restx" width="1000">
</details>

<details>
  <summary><h3>Auth</h3></summary>
  <img src="https://drive.google.com/uc?id=1NptsCM1qn74-_zecCLQ3JTHrxBp61RQd" alt="auth" width="1000">
</details>

<details>
  <summary><h3>Health</h3></summary>

  #### Respone - 200
  ```json
  {
    "status": "healthy",
    "message": "API is up and running",
    "components": {
      "database": "connected",
      "model": "loaded",
      "storage": "accessible"
    }
  }
  ```
</details>

<details>
  <summary><h3>Prediction</h3></summary>

  #### Unauthorized - 401
  ```json
  {
      "message": "Invalid or expired token"
  }
  ```

  #### Invalid Image - 400
  ```json
  {
    "message": "No file selected"
  }
  ```

  #### Model error - 500
  ```json
  {
    "message": "Model prediction error"
  }
  ```

  #### Success - 200
  ```json
  {
    "status": "Prediction Success",
    "face_disease": "Redness",
    "disease_accuracy": "99.9%",
    "disease_description": "Redness caused by irritation or allergies, possibly due to Vitamin C or K deficiency.",
    "image_url": "https://storage.googleapis.com/bioface/user_image/52cd63d347db467b8a65de0713c0b77d.jpg",
    "prediction_detail": {
      "causes": [
        "Chemical irritants",
        "Deficiency in Vitamin C/K",
        "Allergic reactions to specific ingredients"
      ],
      "detail_disease_accuracy": {
        "acne": "0.0%",
        "clear": "0.0%",
        "redness": "99.9%",
        "wrinkle": "0.0%"
      }
    },
    "recomendation": {
      "herbalSolutions": [
        {
          "name": "Calendula",
          "benefit": "Anti-inflammatory and calms irritation",
          "usage": "Apply calendula cream to red or inflamed areas.",
          "imageUrl": "https://storage.googleapis.com/bioface/data/herbal/Redness/Calendula.png"
        },
        {
          "name": "Centella Asiatica",
          "benefit": "Boosts skin regeneration",
          "usage": "Use Centella extract as a serum.",
          "imageUrl": "https://storage.googleapis.com/bioface/data/herbal/Redness/Centella%20Asiatica.png"
        },
        {
          "name": "Oatmeal",
          "benefit": "Soothes sensitive skin",
          "usage": "Use oatmeal as a mask.",
          "imageUrl": "https://storage.googleapis.com/bioface/data/herbal/Redness/Oatmeal.png"
        }
      ],
      "skincareProducts": [
        {
          "name": "Nacific Real Floral Toner Calendula",
          "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Redness/Nacific%20Real%20Floral%20Toner%20Calendula.png"
        },
        {
          "name": "Kiehl's Calendula & Aloe Soothing Hydration Masque",
          "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Redness/Kiehl's%20Calendula%20%26%20Aloe%20Soothing%20Hydration%20Masque.jpg"
        },
        {
          "name": "Dear, Klairs Midnight Blue Calming Cream",
          "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Redness/Dear%2C%20Klairs%20Midnight%20Blue%20Calming%20Cream.jpg"
        },
        {
          "name": "Cosrx Centella Blemish Cream",
          "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Redness/Cosrx%20Centella%20Blemish%20Cream.jpg"
        },
        {
          "name": "True To Skin Matcha Oat Gentle Cleanser",
          "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Redness/True%20To%20Skin%20Matcha%20Oat%20Gentle%20Cleanser.png"
        },
        {
          "name": "Harlette Oatmilk Gentle Facial Wash",
          "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Redness/Harlette%20Oatmilk%20Gentle%20Facial%20Wash.png"
        }
      ]
    }
  }
  ```
</details>

<details>
  <summary><h3>History User</h3></summary>

  #### Unauthorized - 401
  ```json
  {
      "message": "Invalid or expired token"
  }
  ```

  #### Not Found - 404
  ```json
  {
    "message": "No prediction history found. You have requested this URI [/history] but did you mean /history or /history/<int:id> ?"
  }
  ```

  #### Success - 200
  ```json
  {
    "status": "Success",
    "email": "selverie.schugle@gmail.com",
    "predictions": [
      {
        "disease_accuracy": "99.9%",
        "disease_description": "Redness caused by irritation or allergies, possibly due to Vitamin C or K deficiency.",
        "face_disease": "Redness",
        "id": 2,
        "image_url": "https://storage.googleapis.com/bioface/user_image/52cd63d347db467b8a65de0713c0b77d.jpg",
        "prediction_detail": {
          "causes": [
            "Chemical irritants",
            "Deficiency in Vitamin C/K",
            "Allergic reactions to specific ingredients"
          ],
          "detail_disease_accuracy": "{'acne': '0.0%', 'clear': '0.0%', 'redness': '99.9%', 'wrinkle': '0.0%'}"
        },
        "recomendation": {
          "herbalSolutions": [
            {
              "name": "Calendula",
              "benefit": "Anti-inflammatory and calms irritation",
              "usage": "Apply calendula cream to red or inflamed areas.",
              "imageUrl": "https://storage.googleapis.com/bioface/data/herbal/Redness/Calendula.png"
            },
            {
              "name": "Centella Asiatica",
              "benefit": "Boosts skin regeneration",
              "usage": "Use Centella extract as a serum.",
              "imageUrl": "https://storage.googleapis.com/bioface/data/herbal/Redness/Centella%20Asiatica.png"
            },
            {
              "name": "Oatmeal",
              "benefit": "Soothes sensitive skin",
              "usage": "Use oatmeal as a mask.",
              "imageUrl": "https://storage.googleapis.com/bioface/data/herbal/Redness/Oatmeal.png"
            }
          ],
          "skincareProducts": [
            {
              "name": "Nacific Real Floral Toner Calendula",
              "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Redness/Nacific%20Real%20Floral%20Toner%20Calendula.png"
            },
            {
              "name": "Kiehl's Calendula & Aloe Soothing Hydration Masque",
              "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Redness/Kiehl's%20Calendula%20%26%20Aloe%20Soothing%20Hydration%20Masque.jpg"
            },
            {
              "name": "Dear, Klairs Midnight Blue Calming Cream",
              "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Redness/Dear%2C%20Klairs%20Midnight%20Blue%20Calming%20Cream.jpg"
            },
            {
              "name": "Cosrx Centella Blemish Cream",
              "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Redness/Cosrx%20Centella%20Blemish%20Cream.jpg"
            },
            {
              "name": "True To Skin Matcha Oat Gentle Cleanser",
              "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Redness/True%20To%20Skin%20Matcha%20Oat%20Gentle%20Cleanser.png"
            },
            {
              "name": "Harlette Oatmilk Gentle Facial Wash",
              "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Redness/Harlette%20Oatmilk%20Gentle%20Facial%20Wash.png"
            }
          ]
        },
        "timestamp": "Sun, 08 Dec 2024 15:25:16 GMT"
      },
      {
        "disease_accuracy": "79.7%",
        "disease_description": "Healthy, normal skin without specific concerns.",
        "face_disease": "Clear",
        "id": 1,
        "image_url": "https://storage.googleapis.com/bioface/user_image/16ac335f6d4344cd9e2a8cc68d95443a.jpeg",
        "prediction_detail": {
          "causes": [],
          "detail_disease_accuracy": "{'acne': '10.9%', 'clear': '79.7%', 'redness': '5.3%', 'wrinkle': '4.2%'}"
        },
        "recomendation": {
          "herbalSolutions": [
            {
              "name": "Chamomile",
              "benefit": "Soothes the skin and prevents irritation",
              "usage": "Brew chamomile tea and use it as a toner.",
              "imageUrl": "https://storage.googleapis.com/bioface/data/herbal/Clear/Chamomile.png"
            },
            {
              "name": "Rose",
              "benefit": "Hydrates and moisturizes the skin",
              "usage": "Use rose water as a facial mist.",
              "imageUrl": "https://storage.googleapis.com/bioface/data/herbal/Clear/Rose.png"
            }
          ],
          "skincareProducts": [
            {
              "name": "Herbivore Rose Hibiscus Hydrating Mist",
              "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Clear/Herbivore%20Rose%20Hibiscus%20Hydrating%20Mist.png"
            },
            {
              "name": "The Body Shop Fresh Plumping Mask",
              "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Clear/The%20Body%20Shop%20Fresh%20Plumping%20Mask.jpg"
            },
            {
              "name": "Yves Rocher Sensitive Chamomile Soothing Light Cream",
              "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Clear/Yves%20Rocher%20Sensitive%20Chamomile%20Soothing%20Light%20Cream.jpg"
            },
            {
              "name": "Sensatia Botanicals Calming Chamomile Facial Toner",
              "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Clear/Sensatia%20Botanicals%20Calming%20Chamomile%20Facial%20Toner.jpg"
            }
          ]
        },
        "timestamp": "Sat, 07 Dec 2024 16:54:11 GMT"
      }
    ]
  }
  ```
</details>

<details>
  <summary><h3>History By ID</h3></summary>

  #### Unauthorized - 401
  ```json
    {
        "message": "Invalid or expired token"
    }
  ```
  #### Not Found - 404
  ```json
  {
    "message": "No prediction found for ID 2. You have requested this URI [/history/2] but did you mean /history/<int:id> or /history or /history/delete-all ?"
  }
  ```
  #### Sucess - 200
  ```json
  {
    "status": "success",
    "email": "selverie.schugle@gmail.com",
    "prediction": {
      "id": 1,
      "filename": "16ac335f6d4344cd9e2a8cc68d95443a.jpeg",
      "disease_accuracy": "79.7%",
      "disease_description": "Healthy, normal skin without specific concerns.",
      "face_disease": "Clear",
      "image_url": "https://storage.googleapis.com/bioface/16ac335f6d4344cd9e2a8cc68d95443a.jpeg",
      "prediction_detail": {
        "causes": [],
        "detail_disease_accuracy": "{'acne': '10.9%', 'clear': '79.7%', 'redness': '5.3%', 'wrinkle': '4.2%'}"
      },
      "timestamp": "Sat, 07 Dec 2024 16:54:11 GMT",
      "recomendation": {
        "herbalSolutions": [
          {
            "name": "Chamomile",
            "benefit": "Soothes the skin and prevents irritation",
            "usage": "Brew chamomile tea and use it as a toner.",
            "imageUrl": "https://storage.googleapis.com/bioface/data/herbal/Clear/Chamomile.png"
          },
          {
            "name": "Rose",
            "benefit": "Hydrates and moisturizes the skin",
            "usage": "Use rose water as a facial mist.",
            "imageUrl": "https://storage.googleapis.com/bioface/data/herbal/Clear/Rose.png"
          }
        ],
        "skincareProducts": [
          {
            "name": "Herbivore Rose Hibiscus Hydrating Mist",
            "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Clear/Herbivore%20Rose%20Hibiscus%20Hydrating%20Mist.png"
          },
          {
            "name": "The Body Shop Fresh Plumping Mask",
            "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Clear/The%20Body%20Shop%20Fresh%20Plumping%20Mask.jpg"
          },
          {
            "name": "Yves Rocher Sensitive Chamomile Soothing Light Cream",
            "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Clear/Yves%20Rocher%20Sensitive%20Chamomile%20Soothing%20Light%20Cream.jpg"
          },
          {
            "name": "Sensatia Botanicals Calming Chamomile Facial Toner",
            "imageUrl": "https://storage.googleapis.com/bioface/data/skincare_product/Clear/Sensatia%20Botanicals%20Calming%20Chamomile%20Facial%20Toner.jpg"
          }
        ]
      }
    }
  }
  ```
</details>

<details>
  <summary><h3>Delete All</h3></summary>

  #### Unauthorized - 401
  ```json
  {
      "message": "Invalid or expired token"
  }
  ```

  #### Error - 404
  ```json
  {
    "message": "Error during deletion"
  }
  ```

  #### Success - 200
  ```json
  {
    "status": "Success",
    "message": "5 prediction history entries deleted successfully"
  }
  ```
</details>

<details>
  <summary><h3>Delete By ID</h3></summary>

  #### Unauthorized - 401
  ```json
  {
      "message": "Invalid or expired token"
  }
  ```

  #### Not Found - 404
  ```json
  {
    "message": "No prediction found for ID 1 or unauthorized access. You have requested this URI [/history/1] but did you mean /history/<int:id> or /history or /history/delete-all ?"
  }
  ```

  #### Success - 200
  ```json
  {
    "status": "Success",
    "message": "Prediction history entry with ID 7 deleted successfully"
  }
  ```
</details>

## Technology Stack
### Main
<img src="https://drive.google.com/uc?id=13nawsRnvfqHqpBy-ta2s6SGepwQXQHMq" alt="Features & Tech" width="750">

### Bioface Model API
<img src="https://drive.google.com/uc?id=1cxSZ45GDDVEohN5RhE0L9TDdI2YIb62B" alt="Features & Tech" width="500">
