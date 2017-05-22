import javax.enterprise.context {
	sessionScoped
}
import javax.faces.bean {
	viewScoped,
	managedBean
}
import javax.inject {
	inject
}

shared final class User(shared String? name = null) {}

sessionScoped
shared class SessionBean
{
	shared User user;
	
	shared new () {
		user = User();
/*NPE:
 Caused by: java.lang.NullPointerException
 at npewildflycdi.User.<init>(User.ceylon:12)
 at npewildflycdi.User.<init>(User.ceylon:12)
 at npewildflycdi.SessionBean.<init>(User.ceylon:20)
 at npewildflycdi.SessionBean$Proxy$_$$_WeldClientProxy.<init>(Unknown Source)
 at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
 at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
 at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
 at java.lang.reflect.Constructor.newInstance(Constructor.java:423)
 at java.lang.Class.newInstance(Class.java:442)
 at org.jboss.weld.bean.proxy.DefaultProxyInstantiator.newInstance(DefaultProxyInstantiator.java:43)
 at org.jboss.weld.bean.proxy.ProxyFactory.run(ProxyFactory.java:334)
 at org.jboss.weld.bean.proxy.ProxyFactory.create(ProxyFactory.java:326)
 at org.jboss.weld.bean.proxy.ClientProxyFactory.create(ClientProxyFactory.java:83)
 at org.jboss.weld.bean.proxy.ClientProxyProvider.createClientProxy(ClientProxyProvider.java:209)
 at org.jboss.weld.bean.proxy.ClientProxyProvider.createClientProxy(ClientProxyProvider.java:199)
 at org.jboss.weld.bean.proxy.ClientProxyProvider.access$100(ClientProxyProvider.java:47)
 at org.jboss.weld.bean.proxy.ClientProxyProvider$CreateClientProxy.load(ClientProxyProvider.java:55)
 at org.jboss.weld.bean.proxy.ClientProxyProvider$CreateClientProxy.load(ClientProxyProvider.java:51)
 at com.google.common.cache.LocalCache$LoadingValueReference.loadFuture(LocalCache.java:3527)
 at com.google.common.cache.LocalCache$Segment.loadSync(LocalCache.java:2319)
 at com.google.common.cache.LocalCache$Segment.lockedGetOrLoad(LocalCache.java:2282)
 at com.google.common.cache.LocalCache$Segment.get(LocalCache.java:2197)
 at com.google.common.cache.LocalCache.get(LocalCache.java:3937)
 at com.google.common.cache.LocalCache.getOrLoad(LocalCache.java:3941)
 at com.google.common.cache.LocalCache$LocalLoadingCache.get(LocalCache.java:4824)
 at org.jboss.weld.util.cache.LoadingCacheUtils.getCacheValue(LoadingCacheUtils.java:49)
 at org.jboss.weld.util.cache.LoadingCacheUtils.getCastCacheValue(LoadingCacheUtils.java:74)
 at org.jboss.weld.bean.proxy.ClientProxyProvider.getClientProxy(ClientProxyProvider.java:233)
 at org.jboss.weld.manager.BeanManagerImpl.getReference(BeanManagerImpl.java:736)
 at org.jboss.weld.manager.BeanManagerImpl.getInjectableReference(BeanManagerImpl.java:842)
 at org.jboss.weld.injection.FieldInjectionPoint.inject(FieldInjectionPoint.java:92)
 at org.jboss.weld.util.Beans.injectBoundFields(Beans.java:364)
 at org.jboss.weld.util.Beans.injectFieldsAndInitializers(Beans.java:375)
 at org.jboss.weld.injection.producer.DefaultInjector$1.proceed(DefaultInjector.java:71)
 at org.jboss.weld.injection.InjectionContextImpl.run(InjectionContextImpl.java:48)
 at org.jboss.weld.injection.producer.DefaultInjector.inject(DefaultInjector.java:73)
 at org.jboss.weld.injection.producer.BasicInjectionTarget.inject(BasicInjectionTarget.java:121)
 at org.jboss.as.weld.injection.WeldInjectionContext.inject(WeldInjectionContext.java:39)
 at org.jboss.as.weld.injection.WeldInjectionInterceptor.processInvocation(WeldInjectionInterceptor.java:51)
 at org.jboss.invocation.InterceptorContext.proceed(InterceptorContext.java:340)
 at org.jboss.as.ee.component.AroundConstructInterceptorFactory$1.processInvocation(AroundConstructInterceptorFactory.java:28)
 at org.jboss.invocation.InterceptorContext.proceed(InterceptorContext.java:340)
 at org.jboss.as.weld.injection.WeldInterceptorInjectionInterceptor.processInvocation(WeldInterceptorInjectionInterceptor.java:56)
 at org.jboss.invocation.InterceptorContext.proceed(InterceptorContext.java:340)
 at org.jboss.as.weld.injection.WeldInjectionContextInterceptor.processInvocation(WeldInjectionContextInterceptor.java:43)
 at org.jboss.invocation.InterceptorContext.proceed(InterceptorContext.java:340)
 at org.jboss.as.ee.concurrent.ConcurrentContextInterceptor.processInvocation(ConcurrentContextInterceptor.java:45)
 at org.jboss.invocation.InterceptorContext.proceed(InterceptorContext.java:340)
 at org.jboss.invocation.ContextClassLoaderInterceptor.processInvocation(ContextClassLoaderInterceptor.java:64)
 at org.jboss.invocation.InterceptorContext.proceed(InterceptorContext.java:340)
 at org.jboss.invocation.InterceptorContext.run(InterceptorContext.java:356)
 at org.jboss.invocation.PrivilegedWithCombinerInterceptor.processInvocation(PrivilegedWithCombinerInterceptor.java:80)
 at org.jboss.invocation.InterceptorContext.proceed(InterceptorContext.java:340)
 at org.jboss.invocation.ChainedInterceptor.processInvocation(ChainedInterceptor.java:61)
 at org.jboss.as.ee.component.BasicComponent.constructComponentInstance(BasicComponent.java:161)
 ... 81 more 
 */		
	}
}

viewScoped managedBean
shared class HomeView()
{
	
	shared late inject SessionBean session;
	
	shared String name => session.user.name else "Anonym";
	
}
