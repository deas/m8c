# https://code.claude.com/docs/en/google-vertex-ai
#
# Enable Vertex AI integration
export CLAUDE_CODE_USE_VERTEX=1

# Set your Project ID
export ANTHROPIC_VERTEX_PROJECT_ID="proj-prod-ai"

# Set the region (global is recommended for best availability)
export CLOUD_ML_REGION="global"

# Point to your service account key file
export GOOGLE_APPLICATION_CREDENTIALS="gcp-prod-ai-sa-key.json"

# Region Conflicts: If a specific model is unavailable in global, you can override it per model:
# export VERTEX_REGION_CLAUDE_3_5_SONNET="us-east5"

# Validate using
# claude /status
