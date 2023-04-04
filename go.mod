module github.com/gardener/external-dns-management

go 1.16

require (
	github.com/Azure/azure-sdk-for-go v39.0.0+incompatible
	github.com/Azure/go-autorest/autorest/azure/auth v0.4.2
	github.com/Azure/go-autorest/autorest/to v0.3.0 // indirect
	github.com/ahmetb/gen-crd-api-reference-docs v0.2.0
	github.com/aliyun/alibaba-cloud-sdk-go v0.0.0-20190603021944-12ad9f921c0b
	github.com/aws/aws-sdk-go v1.38.43
	github.com/cloudflare/cloudflare-go v0.11.4
	github.com/emicklei/go-restful v2.9.6+incompatible // indirect
	github.com/gardener/controller-manager-library v0.2.1-0.20210831082646-8ac5ffdda775
	github.com/go-openapi/spec v0.19.7 // indirect
	github.com/go-openapi/swag v0.19.9 // indirect
	github.com/gophercloud/gophercloud v0.18.0
	github.com/gophercloud/utils v0.0.0-20190527093828-25f1b77b8c03
	github.com/kr/text v0.2.0 // indirect
	github.com/mailru/easyjson v0.7.1 // indirect
	github.com/miekg/dns v1.1.43
	github.com/onsi/ginkgo v1.15.0
	github.com/onsi/gomega v1.10.5
	github.com/pkg/errors v0.9.1
	github.com/prometheus/client_golang v1.7.1
	github.com/sirupsen/logrus v1.8.0 // indirect
	golang.org/x/lint v0.0.0-20200302205851-738671d3881b
	golang.org/x/oauth2 v0.0.0-20200107190931-bf48bf16ab8d
	google.golang.org/api v0.20.0
	gopkg.in/ini.v1 v1.54.0 // indirect
	k8s.io/api v0.20.6
	k8s.io/apiextensions-apiserver v0.20.6
	k8s.io/apimachinery v0.20.6
	k8s.io/client-go v0.20.6
	k8s.io/code-generator v0.20.6
	k8s.io/kube-openapi v0.0.0-20201113171705-d219536bb9fd
	sigs.k8s.io/kind v0.10.0
)
