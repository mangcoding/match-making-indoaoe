import { Page } from '@inertiajs/core';
import { Component, PluginObject } from 'vue';
import { ComponentOptions } from 'vue/types/umd';
export interface InertiaProps {
    initialPage: Page;
    initialComponent?: object;
    resolveComponent?: (name: string) => Component;
    titleCallback?: (title: string) => string;
    onHeadUpdate?: (elements: string[]) => void;
}
export type InertiaApp = ComponentOptions<never, any, never, never, any, InertiaProps>;
declare const App: InertiaApp;
export default App;
export declare const plugin: PluginObject<any>;
export declare function usePage(): {
    props: any;
    url: any;
    component: any;
    version: any;
};
