
# Get all maps
#--------------
url0a="https://www.karto365.de/portal/sharing/rest/search?q=deutschlandatlas&f=json&num=100&start=1"
dat0a=httr::content(httr::GET(url0a))
maps0a=do.call(cbind,lapply(dat0a$results,function(x)c(x$title,x$snippet,x$url)))
url0b="https://www.karto365.de/portal/sharing/rest/search?q=deutschlandatlas&f=json&num=100&start=101"
dat0b=httr::content(httr::GET(url0b))
maps0b=do.call(cbind,lapply(dat0b$results[-length(dat0b$results)],function(x)c(x$title,x$snippet,x$url)))
dat=t(cbind(maps0a,maps0b))
colnames(dat)=c("title","snippet","url")


# Get field for each map
#------------------------
pathParameters=dat[,1]
x=sapply(pathParameters,function(p){
	h=httr::GET(paste0("https://www.karto365.de/hosting/rest/services/",p,"/MapServer/layers"))
 	x=gsub(".*> ","",qqBaseX::matchAll(as.character(h),"Field: </i> [^ <]*"))
	print(x)
	x
})
x[x=="logical(0)"]=""

dat=cbind(dat,x);

# Output Markdown-table
#----------------------
tab=paste(c(
	paste0("|",paste0(colnames(dat),collapse="|"),"|"),
	paste0("|",paste0(gsub(".*","---",colnames(dat)),collapse="|"),"|"),
	apply(dat,1,function(a)paste0("|",gsub("\n"," ",paste0(a,collapse="|")),"|"))),
	collapse="\n")

writeLines(tab,"table_deutschlandatlas.txt")

