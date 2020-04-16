//<!--
var ETNGpager = function( srcName, dstName, cntPP, cntPS )
{
this.srcName = srcName;
this.dstName = dstName;
this.curP   = 1;//榛樿褰撳墠椤典负绗竴椤�
this.cntPP   = cntPP || 2;//榛樿姣忛〉涓ゆ潯绾綍
this.cntPS   = cntPS || 3;//榛樿姣忛〉鏄剧ず5涓垎椤典笂涓嬫枃
this.items   = [];
this.showPNP = true;/*鏄剧ず涓婁笅椤甸摼鎺�*/
this.showType = true;/*婊戝姩鍒嗛〉*/
this.result   = {pagedata:[],pagebar:'',limit:[0,0],report:''};
this.parse();/*鎬荤邯褰曟暟*/
}
ETNGpager.prototype.page = function (){
this.cntP = Math.ceil(this.cntR/this.cntPP);/*鎬婚〉鏁�*/
this.cntS = Math.ceil(this.cntP/this.cntPS);/*鎬绘鏁�*/
this.curS = Math.ceil(this.curP/this.cntPS);/*褰撳墠娈�*/
this.preP = this.curP -1;/*涓婁竴椤�*/
this.nextP = this.curP +1;/*涓嬩竴椤�*/
this.preS = this.curS -1;/*涓婁竴娈�*/
this.nextS = this.curS +1;/*涓嬩竴娈�*/
this.startR = (this.curP -1)*this.cntPP + 1;/*璧峰绾綍*/
this.endR = (this.curP*this.cntPP >this.cntR)?this.cntR:this.curP*this.cntPP;/*缁撴潫绾綍*/
this.result['pagedata']=[];
if(this.showType){
this.perSide = Math.floor(this.cntPS/2);
this.startP   = (this.curP > this.perSide)?(this.curP - this.perSide):1;
this.endP   = (this.startP + this.cntPS)>this.cntP?this.cntP:(this.startP + this.cntPS);
}else{
this.startP   = (this.curS-1)*this.cntPS+1;
this.endP   = (this.curS*this.cntPS>this.cntP)?this.cntP:(this.curS*this.cntPS);
}
for(var i = this.startP;i<=this.endP;i++){
this.result['pagedata'].push((i==this.curP)?'<a  href="#topnew" class="curPage">'+i+'</a>':'<a  href="#topnew" onclick="page('+i+')">'+i+'</a>');
}
if(this.showPNP){
if(this.curP>1)this.result['pagedata'].unshift('<a  href="#topnew" onclick="page('+(this.curP-1)+')">上一页</a>');
if(this.curP<this.cntP)this.result['pagedata'].push('<a  href="#topnew" onclick="page('+(this.curP+1)+')">下一页</a>');
}
this.result['pagebar'] = this.result['pagedata'].join('&nbsp;&nbsp;');
this.result['limit'] = [this.startR,this.endR];
this.result['report'] ='<a class="allpage"><b>'+this.cntR+'</b></a>&nbsp;&nbsp;' ;
}
ETNGpager.prototype.parse = function (){
var obj = document.getElementById(this.srcName);
for(var i = 0;i<obj.childNodes.length;i++){
if(obj.childNodes[i].nodeType!=3)this.items[this.items.length]=obj.childNodes[i].innerHTML;
}
this.cntR = this.items.length;
return this.items.length;
}
ETNGpager.prototype.create=function(){
this.page();
document.getElementById(this.dstName).innerHTML='<li>'+this.items.slice(this.startR-1,this.endR).join('</li><li>')+'</li>';
document.getElementById(this.dstName).innerHTML+='<div class="pagelist mt20">'+this.result['report']+this.result['pagebar']+'</div>';
}
//-->