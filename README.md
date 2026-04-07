# 🚀 Docker Image Push Project

## 📌 Objective

To build a Simple functions and write test file then trigger Github Actions on push event. It will create build and run tests then a Docker image will be created and pushed to Docker Registry.

---

## 🔧 Steps Performed

### 1. When Code is pushed to Github repo it will trigger Github Actions

```bash
git push origin main
```

![All Files](screenshots/cicd_build.png.png)

---

### 2. Actions will run tests on it and give success or failure

![Build Image](screenshots/cicd_test_success.png.png)

---

### 3. After success image will be built and pushed to Docker Hub

![Run Container](screenshots/cicd_dockerhub_image.png.png)

### What is CI(Continuous Integration)?
CI is the practice of merging code frequently and automatically testing it every time you make a change.

### What is CD(Continuous Delivery/Deployment)?
CD is the process of automatically preparing and releasing that tested code to your servers.

### How Github Actions works?
GitHub Actions is a built-in platform that automates your entire workflow based on "events."


## 📦 Docker Hub Repository

https://hub.docker.com/r/awaisabdulsalam/devops-week-3-cicd


---

## ✅ Conclusion

Successfully built and pushed Docker image to Docker Hub.
